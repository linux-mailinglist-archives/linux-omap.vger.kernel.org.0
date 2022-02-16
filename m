Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91FA84B83AC
	for <lists+linux-omap@lfdr.de>; Wed, 16 Feb 2022 10:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbiBPJFG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Feb 2022 04:05:06 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:38302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbiBPJFF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Feb 2022 04:05:05 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A122AE04A
        for <linux-omap@vger.kernel.org>; Wed, 16 Feb 2022 01:04:53 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id d27so2294484wrc.6
        for <linux-omap@vger.kernel.org>; Wed, 16 Feb 2022 01:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sFF5uu9WmnNvmV+Pej/S6QC+JsSr4mKpkT5UiTK3TLQ=;
        b=nBTi1kl16v2HTVqAsJPxDCbZUC9XvKNyjE1jSqbLsLepXLSRSuyiH0jjhps109X3NS
         5hESk23tHrLfGAzldZCotZnOlaIITIjtWzTo/aWzZFm+eOOeYOGyP/jowEhLhYWv0Jkt
         cp/uFi/VEHzBixfAJWOvdHVguyI6pAxO4z0dp9ODl+7j2h52FLugVjH2Ax7tdtFQ07jq
         uAduTLZ9NlZF/rDG3BNeS8uOYD0brPHEM+HD0L5SQSN7jCtetP7TGPfTRVYdOcoURp7H
         RAszxkGyrcIvZ5HpD01w3URAeh4/1BvqXZnrZ+fPOFUL8D1psIXdA2ay5OwUDYWLvOem
         mYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sFF5uu9WmnNvmV+Pej/S6QC+JsSr4mKpkT5UiTK3TLQ=;
        b=Nw8WNW1P1ITo17LP2omGMx5RqsV4izA4jKhG9xNS9WYqciYklRl7rlYdfYULurTdzS
         fENWAwTkDU9tJvawI63tqEQFLfGk0aKXspfhZDUBv1EUPrrvSCBSLmU3ikU9hhDp9gBB
         drHByEfBkNqSN4JGTUtJ8olX1LIRnTe9PYRYc/ihWNXmOhvs0h9F6gIItwL5wdtbG3pD
         ZynvvyaECjqGcNFHK0dXbr/q8gKtgqBLCFfFWlhDffqwJHGt3HuYEiEqk/wXceK29C15
         fRljOdQ+4ER2HaYORTIg9hjkNDIlBh4QwLFFIzLw8Z+yknpI9VkiAO4k9M5wvYR6eNKI
         3TYQ==
X-Gm-Message-State: AOAM5330wAjnxVK6Cw+ehoiCGwLr1csAiW9kbKTBcbT55gcZpOeyzB3d
        MK9aM2SpSP8sYeMl9g3V4kBoKA==
X-Google-Smtp-Source: ABdhPJzsStJlrt68HpUxG1ACglaWtMyWDmnHmJ+6srR6Ss6lkwAaN0lhu3hNzHa4sjBdTtg9X2cHMA==
X-Received: by 2002:adf:d234:0:b0:1e5:78a3:773e with SMTP id k20-20020adfd234000000b001e578a3773emr1512998wrh.136.1645002292011;
        Wed, 16 Feb 2022 01:04:52 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id z5sm21704163wmp.10.2022.02.16.01.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 01:04:51 -0800 (PST)
Message-ID: <ca2faa1d-715b-77f8-4f19-037ba9aabc8e@smile.fr>
Date:   Wed, 16 Feb 2022 10:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: AM5749: tty serial 8250 omap driver crash
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
References: <2c80fd8a-2935-9a6d-43fd-f95fa53c93d2@smile.fr>
 <YgDSj7FJS7nbkJol@atomide.com>
 <e3cf5082-b494-9309-6878-da208920fa5a@smile.fr>
 <YgT/fhpFQfkj1b0j@atomide.com>
 <9f0cb8f9-ac94-eb50-266a-95df521a7360@smile.fr>
 <YgoIMPZd7bi6XDGW@atomide.com> <YgpUNMAiXgu+vrtl@atomide.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <YgpUNMAiXgu+vrtl@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

Le 14/02/2022 à 14:08, Tony Lindgren a écrit :
> * Tony Lindgren <tony@atomide.com> [220214 07:43]:
>> Looks like the following script to just toggle the module state locks
>> up things for me on beagle-x15 very fast. So yeah now I'm able to
>> reproduce the issue. Seems like the module is not ready right after
>> enabling it live we've seen for dra7 iva for example.
> 
> Looks like the following patch is also needed for uarts to avoid unbind
> clock_unprepare warnings. But even with this patch dra7 uarts won't behave.
> On unbind, there will be a clock "l4per-clkctrl:0128:0: failed to disable"
> warning. Looks like after that any following clock enable does not seem to
> work and that will cause the register access errors.
> 
> Looks like this is a dra7 specific issue as a similar test script on omap4
> duovero keeps on going instead.

Thanks for the help and the patch!

I removed my patch removing the quirk and applied you patch but I can still
reproduce the issue.

Do you need some info about the kernel configuration?

Best regards,
Romain


> 
> Regards,
> 
> Tony
> 
> 8< --------------
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -3381,7 +3381,9 @@ static int sysc_remove(struct platform_device *pdev)
>  	struct sysc *ddata = platform_get_drvdata(pdev);
>  	int error;
>  
> -	cancel_delayed_work_sync(&ddata->idle_work);
> +	/* Device can still be enabled, see deferred idle quirk in probe */
> +	if (cancel_delayed_work_sync(&ddata->idle_work))
> +		ti_sysc_idle(&ddata->idle_work.work);
>  
>  	error = pm_runtime_resume_and_get(ddata->dev);
>  	if (error < 0) {

