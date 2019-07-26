Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD6776BBF
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jul 2019 16:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbfGZOjI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jul 2019 10:39:08 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:43692 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfGZOjI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 Jul 2019 10:39:08 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6QEcwkr041238;
        Fri, 26 Jul 2019 09:38:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564151938;
        bh=J+EQZgCBsyteq1hOP8cMdxqBBlEMRMVub8QpeqjnQTs=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=k6+ikWOiAUs7sjOQ4nM9sgDSRQJGe/LKfFZd2t/rQdf0ErsVgh6AV4KOgoPT6Kro+
         PIJpAIqYbMGhNCG0sl3zxxY/Ljph+TghJez5Id4ptsqdQbkMm4Ms5mzYMy1OnYg8Wk
         chkswtDI2C575TPVIw+sXgwj97dfG39go4t7LX8Q=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6QEcw8S082901
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 26 Jul 2019 09:38:58 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 26
 Jul 2019 09:38:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 26 Jul 2019 09:38:58 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6QEcvhp025112;
        Fri, 26 Jul 2019 09:38:57 -0500
Subject: Re: Backlight in motorola Droid 4
From:   Dan Murphy <dmurphy@ti.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <sre@kernel.org>,
        <nekit1000@gmail.com>, <mpartap@gmx.net>, <merlijn@wizzup.org>,
        <jacek.anaszewski@gmail.com>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20190722205921.GA24787@amd> <b8fbc94f-c087-2c9d-4532-ea423f1626e6@ti.com>
 <20190724124530.GA30211@amd> <ca69f627-96e2-f982-3a29-18b0127ac6e5@ti.com>
Message-ID: <edde330e-516b-ecaa-4139-0bfa766a9c08@ti.com>
Date:   Fri, 26 Jul 2019 09:38:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ca69f627-96e2-f982-3a29-18b0127ac6e5@ti.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Pavel

On 7/24/19 10:22 AM, Dan Murphy wrote:
> Pavel
>
> On 7/24/19 7:45 AM, Pavel Machek wrote:
> <snip>
>>
>> +
>>   static int lm3532_parse_node(struct lm3532_data *priv)
>>   {
>>       struct fwnode_handle *child = NULL;
>> @@ -536,11 +579,13 @@ static int lm3532_parse_node(struct lm3532_data 
>> *priv)
>>           ret = fwnode_property_read_u32(child, "ti,led-mode",
>>                              &led->mode);
>>           if (ret) {
>> +          /* FIXME: should just default to non-als mod */
>
> Looking at the rest of the code.
>
> The DT doc indicated that this was a required child property so this 
> is why it
>
> errors out.
>
> Dan
>
> <snip>
>

Did you want me to fix up the LM3532 and send the patch?

Or do you have a patch ready to go?

Dan

