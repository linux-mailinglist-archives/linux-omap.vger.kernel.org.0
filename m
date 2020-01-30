Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C113914DFA4
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2020 18:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgA3RJz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jan 2020 12:09:55 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35078 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727417AbgA3RJz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jan 2020 12:09:55 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00UH8sTu120578;
        Thu, 30 Jan 2020 11:08:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580404134;
        bh=zCnXxzU/EUyxz2StGAYBKDJKmkVjS0wWM+yswum6tEc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=G39DJeW9wpm9C/7pNqXSda95uaioGn1Ihy5r/RUiX0c+l58jt9GtlfYrZ95LFcKMw
         9+h3vai439QcZ6jcMzv2NnByN4gaI/JerdlZMNDzipRa5I0EiNxXxm9DEA3t9hs2hP
         A/ylH5/pLGwg2/PYQYczua4RutEdnmo+sOk08g3A=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00UH8sdK126653
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 30 Jan 2020 11:08:54 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 30
 Jan 2020 11:08:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 30 Jan 2020 11:08:54 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00UH8rQO026105;
        Thu, 30 Jan 2020 11:08:53 -0600
Subject: Re: [PATCH v2] mfd: syscon: Use a unique name with regmap_config
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>
References: <20200127231208.1443-1-s-anna@ti.com>
 <CAHp75VfaOfBZYjQa960keORW=VjOn2PdwoYpJMG7SsN83daSJg@mail.gmail.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <99a04c52-1ff6-1611-5cf6-2c71b810ba43@ti.com>
Date:   Thu, 30 Jan 2020 11:08:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VfaOfBZYjQa960keORW=VjOn2PdwoYpJMG7SsN83daSJg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Andy,

On 1/30/20 9:34 AM, Andy Shevchenko wrote:
> On Tue, Jan 28, 2020 at 1:14 AM Suman Anna <s-anna@ti.com> wrote:
>>
>> The DT node full name is currently being used in regmap_config
>> which in turn is used to create the regmap debugfs directories.
>> This name however is not guaranteed to be unique and the regmap
>> debugfs registration can fail in the cases where the syscon nodes
>> have the same unit-address but are present in different DT node
>> hierarchies. Replace this logic using the syscon reg resource
>> address instead (inspired from logic used while creating platform
>> devices) to ensure a unique name is given for each syscon.
> 
>> -       syscon_config.name = of_node_full_name(np);
>> +       syscon_config.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", np,
>> +                                      (u64)res.start);
> 
> Explicit castings in printf() usually tell us that something is not okay.

Yes, I agree in general.

> Yes, for resource_size_t we have %pa.

And that was the first thing I tried when doing v2, before moving away
from it. This is not for a console printf statement, but is rather for
the regmap debugfs name. Using a %pa adds the 0x and leading zeros in
the debugfs name, when compared to the name before this patch. The
typecast retains the current format, and replaces the unit-address
without the leading 0s either. Introducing a local-variable to avoid the
typecast is overkill.

> 
> On top of that, I would rather see %pfwn to avoid modification for
> other fwnode types.

Did you mean %pfwP? That can probably be handled when syscon code is
updated to use fwnode API.

regards
Suman
