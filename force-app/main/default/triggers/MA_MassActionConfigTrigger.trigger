/**
 * Author: Doug Ayers
 * Website: https://douglascayers.com
 * GitHub: https://github.com/sfdx-mass-action-scheduler/sfdx-mass-action-scheduler
 * License: BSD 3-Clause License
 */
trigger MA_MassActionConfigTrigger on Mass_Action_Configuration__c ( before insert, before update, before delete,
                                                                     after insert, after update, after delete ) {

    MA_MassActionConfigTriggerHandler handler = new MA_MassActionConfigTriggerHandler();

    if ( Trigger.isBefore && Trigger.isInsert ) {
        handler.handleBeforeInsert( Trigger.new );
    }
    else if ( Trigger.isBefore && Trigger.isUpdate ) {
        handler.handleBeforeUpdate( Trigger.old, Trigger.oldMap, Trigger.new, Trigger.newMap );
    }
    else if ( Trigger.isBefore && Trigger.isDelete ) {
        handler.handleBeforeDelete( Trigger.old, Trigger.oldMap );
    }
    else if ( Trigger.isAfter && Trigger.isInsert ) {
        handler.handleAfterInsert( Trigger.new, Trigger.newMap );
    }
    else if ( Trigger.isAfter && Trigger.isUpdate ) {
        handler.handleAfterUpdate( Trigger.old, Trigger.oldMap, Trigger.new, Trigger.newMap );
    }
    else if ( Trigger.isAfter && Trigger.isDelete ) {
        handler.handleAfterDelete( Trigger.old, Trigger.oldMap );
    }

}
/*
BSD 3-Clause License

Copyright (c) 2017-2022, Doug Ayers, douglascayers.com
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

* Neither the name of the copyright holder nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/