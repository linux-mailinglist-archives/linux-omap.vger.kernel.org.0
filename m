Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADAB5EBCD1
	for <lists+linux-omap@lfdr.de>; Tue, 27 Sep 2022 10:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbiI0IKj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Sep 2022 04:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiI0IKM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Sep 2022 04:10:12 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39249DB5A
        for <linux-omap@vger.kernel.org>; Tue, 27 Sep 2022 01:04:09 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28R842Uj016992;
        Tue, 27 Sep 2022 03:04:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1664265843;
        bh=ceqTG+49s5IwExJgcZZSEi61X5cZ0q6qhdOGp/K+RGo=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=fGQkGETrAMmA8eaPAvw/PVMYIEVBqBbmDZnEa5tykhpWdL6UfTpk/yo51icr7V3gZ
         krmfhtiqgJlARgseRgZzCdo3iN1n5qPpUbpmetxEz5D74RtmPSaqBwrFN7S0o4ecRt
         tHJYTHTATZ25+7LWD3K4kA0nnIwN7NXy3X+0TalI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28R8420g026639
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 27 Sep 2022 03:04:02 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 27
 Sep 2022 03:04:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 27 Sep 2022 03:04:02 -0500
Received: from [172.24.145.182] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28R840CP012071;
        Tue, 27 Sep 2022 03:04:01 -0500
Message-ID: <714a68ee-a211-ea63-1da7-5962dbad9f39@ti.com>
Date:   Tue, 27 Sep 2022 13:34:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: prueth: IEP driver doesn't probe anymore
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>,
        Romain Naour <romain.naour@smile.fr>
CC:     Linux-OMAP <linux-omap@vger.kernel.org>,
        "rogerq@kernel.org >> Roger Quadros" <rogerq@kernel.org>,
        Md Danish Anwar <danishanwar@ti.com>
References: <9aced000-5e66-50b9-1e1b-28ff96871d42@smile.fr>
 <28dc112e-94ce-ca21-2e35-97074f251b97@smile.fr>
 <edf56bca-3f90-5cac-7c21-085f4a563dac@smile.fr>
 <YzKa8csiFaJik79O@atomide.com>
From:   Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <YzKa8csiFaJik79O@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 27/09/22 12:10, Tony Lindgren wrote:
> Hi,
> 
> * Romain Naour <romain.naour@smile.fr> [220921 08:13]:
>> Ok, I understand what's going on...
>>
>> The issue appear on the merge commit since on a omap side there was the switch
>> to ti-sysc (devicetree interconnect description) and on upstream side there was
>> a change on driver core behavior with fw_devlink=on being set by default:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ea718c699055c8566eb64432388a04974c43b2ea
> 
> OK good to hear it's not the change to ti-sysc. That should be all pretty
> much standard Linux driver related changes.
> 
>> Actually the issue is really on the TI's prueth and IEP driver whith
>> fw_devlink=on. The IEP driver probe correctly with fw_devlink=permissive.
> 
> Argh not again, the fw_devlink changes seem to be causing all kind of
> issues. Any ideas what the issue here might be? It might be worth testing
> with v6.0-rc7 too as it has a series of fixes to related issues.
> 

Could you also try [1] from Puranjay's series? He did have to rework
pru_rproc_get()/pru_rproc_put() a bit to fix few probe failures seen
only on > 5.11 kernels.

[1] https://lore.kernel.org/netdev/20220406094358.7895-3-p-mohan@ti.com/

-- 
Regards
Vignesh
