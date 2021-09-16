Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DE840D7C4
	for <lists+linux-omap@lfdr.de>; Thu, 16 Sep 2021 12:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235644AbhIPKtn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Sep 2021 06:49:43 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:41034
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235570AbhIPKtn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Sep 2021 06:49:43 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2FC6A3F077
        for <linux-omap@vger.kernel.org>; Thu, 16 Sep 2021 10:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631789302;
        bh=kVs9piweAjfYKX1/D2zYPYLh8oMdXLORitDm0x3OItc=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Z+L8RQG5ANhF34LExzxkQYwIdTOymYuyFGbAHKYFocaLCX0/e2gUFpLHUB9WHRMMs
         7A2Y25zay3vg8bmSJm1K40XQMR2jhvOsRc4vZkPB27prf/XX70m7XzbDbKEzOrsDA5
         4eN/c8CFj+3UMf/Id1ONvw7cbHle7KJshuKrLgiYqok8CT6sAc05yIyJCAraZx1k3b
         N0/Nj9iN/a3to9lQ3xF20cC6lxLica/SZUGPtlS0AB1vyKuV8NEbijWM3BcMnrCN6Q
         YunoCZdIEJnEx1excPiW39+kxfF95/AHsSnOkbL1sCOA6iNY/j3y4UVdrfkZDtEbs8
         Q/5MwZYmU8B9w==
Received: by mail-ed1-f70.google.com with SMTP id j6-20020aa7de86000000b003d4ddaf2bf9so4970816edv.7
        for <linux-omap@vger.kernel.org>; Thu, 16 Sep 2021 03:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kVs9piweAjfYKX1/D2zYPYLh8oMdXLORitDm0x3OItc=;
        b=oVnd7XSh3I+HhrP3dCZKgEAMdw28qBrIhmiZKn/c4GgpRDuKWkwYojv7M94hgwwavs
         ku7VYRiJfPqsmcInE21GgQm3qfnQs4OOo3ILtf0GKs0aBxD5mwXR3R3t3qfjvGFgJP6y
         VqmMRI9eYNVZDywph2FXQWEy9mB+6S4mrfHGUTivKLVKuseIdbLkEQsBL2XwcPtAsIyC
         sp/x31Yl+18P9yks8VOaYYlLWI37K4yCO3CVnOUPTL+nXOyaOQeECetKky7Pma2b1qQW
         3e8izzX1OKTPd6k/70k82UsTJ3+iIlMy/CDoNw+Z+VwWlIMacWZ8JiWOK7lIdf1dWsTo
         umRA==
X-Gm-Message-State: AOAM532s5q+fAdZXl4rz8byBe9CWq1/WMVSkYf0LJcBAa7spQpW55PlG
        eelWuxpHOs1nfhNRCLvkucLG/pkZvJEusoMrIqZH+5hQSKZb75inoVZOwUEvp8pUj6WFyfiB/62
        1VAckcyD4OEdDJLYXLUixtDJkfDDdltGzMyAJDMY=
X-Received: by 2002:a17:906:d045:: with SMTP id bo5mr5518401ejb.461.1631789301890;
        Thu, 16 Sep 2021 03:48:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynS1M3E+u6uh9PExpnyfy/1dCw+s8TwhyM85ZmKchIA4QZXHFyZ+/z9Io2RWKgwjZkL25Tow==
X-Received: by 2002:a17:906:d045:: with SMTP id bo5mr5518370ejb.461.1631789301532;
        Thu, 16 Sep 2021 03:48:21 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id m10sm1007452ejx.76.2021.09.16.03.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 03:48:21 -0700 (PDT)
To:     Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210907113226.31876-1-rogerq@kernel.org>
 <20210907113226.31876-9-rogerq@kernel.org>
 <aa465bd9-b3d5-8d75-3e59-e86c2cd093cd@canonical.com>
 <a881ac1f-2f00-e675-aea6-154b28ca6eff@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 8/8] memory: gpmc-omap: "gpmc,device-width" DT property
 is optional
Message-ID: <35643319-e3b0-bde1-c51b-57c3b5474146@canonical.com>
Date:   Thu, 16 Sep 2021 12:48:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a881ac1f-2f00-e675-aea6-154b28ca6eff@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 15/09/2021 11:11, Roger Quadros wrote:
> Hi Krzysztof,
> 
> On 07/09/2021 15:36, Krzysztof Kozlowski wrote:
>> On 07/09/2021 13:32, Roger Quadros wrote:
>>> Check for valid gpmc,device-width, nand-bus-width and bank-width
>>> at one place. Default to 8-bit width if none present.
>>
>> I don't understand the message in the context of the patch. The title
>> says one property is optional - that's it. The message says you
>> consolidate checks. How is this related to the title?
>>
>> The patch itself moves around checking of properties and reads
>> nand-bus-width *always*. It does not "check at one place" but rather
>> "check always". In the same time, the patch does not remove
>> gpmc,device-width check in other place.
>>
>> All three elements - the title, message and patch - do different things.
>> What did you want to achieve here? Can you help in clarifying it?
>>
> 
> OK I will explain it better in commit log in next revision. Let me explain here a bit.
> 
> Prior to this patch it was working like this
> 
> 	/* in gpmc_read_settings_dt() */
> 	s->device_width = 0;	/* invalid width, should be 1 for 8-bit, 2 for 16-bit */
> 	of_property_read_u32(np, "gpmc,device-width", s->device_width);
> 
> 	/* in gpmc_probe_generic_child () */
> 	if (of_device_is_compatible(child, "ti,omap2-nand")) {
> 		/* check for nand-bus-width, if absent set s->device_width to 1 (i.e. 8-bit) */
> 	} else {
> 		/* check for bank-width, if absent and s->device_width not set, error out */
> 	}
> 
> So that means if all three, "gpmc,device-width". "nand-bus-width" and "bank-width" are missing then
> it would create an error situation.
> 
> The patch is doing 3 things.
> 1) Make sure all DT checks related to bus width are being done at one place for better readability.

Not entirely. The gpmc,device-width is still done in the other place
because you did not remove it from the code. Unless you meant parsing of
gpmc,device-width not reading from DT? But then another round of checks
is in gpmc_cs_program_settings() so not in one place.

If you consolidate the checks to one place, I would expect the code to
be removed from other places, so from gpmc_cs_program_settings() and
gpmc_read_settings_dt(). Since this is not happening, the message
confuses me.

> 2) even if all 3 width properties are absent, we will not treat it as error and default to 8-bit.

This is not mentioned in commit msg.

> 3) check for nand-bus-width regardless of whether compatible to "ti,omap2-nand" or not.

Also not mentioned in commit msg.

Your commit reorganizes parsing and validating the child DT properties
but it does not change from "multiple place" to "one place".

At least I don't see it.

Best regards,
Krzysztof
