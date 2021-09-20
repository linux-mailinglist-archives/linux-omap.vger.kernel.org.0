Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3EF4110DF
	for <lists+linux-omap@lfdr.de>; Mon, 20 Sep 2021 10:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235645AbhITIYW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Sep 2021 04:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235721AbhITIYR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Sep 2021 04:24:17 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A47C061574;
        Mon, 20 Sep 2021 01:22:49 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b15so45997347lfe.7;
        Mon, 20 Sep 2021 01:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=dwBcUOpYm3z8rXEA+PUozq+1tOyH0PSUgQSqSBRtPhg=;
        b=Ofnz1qlQvfEfekIUZmrdOL4RBQ710mQ6fH3B707Ui+KkkPcncOmZ0fmDx8KywdASbx
         tyaeYHVuLAkZPD/RQNM9OyrvlHqITGDkb0Mk1rcy+kuRmptmSA7eBNHC7oBdBOIjuZbt
         /JMUku/m8VCDNR78uq04qCz5exMZ10DZTkSHmd3+i0MZq8DwH+biDNZ+nSgeGfo/KlMg
         l56CChNcTd5U/OVaiQHZoSqP+e/RPFaH87o7oJbyIoaNaSoD0tz+1WdMQTYzJWXBc9bu
         XCI5gvdLCJzlvi0bAniumIivTmL5So9gObcAV5I7x/w5YDK2+aNT2y5pOSE/Rda+J+pO
         gDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=dwBcUOpYm3z8rXEA+PUozq+1tOyH0PSUgQSqSBRtPhg=;
        b=RtUHh9Ggak8Nv7xFEDHJy9KeX4GITbvkIrT1YCkQGwp91yhfQj6C1XfyPDf8yJeuks
         t8Qspl5h3+lcVEdF3M62bFF+CVIP5NArTxaa0tQJcBatrwIXmi0Ix0RRESX9QHvTtRMo
         GePzzhxorG/b5xHcFgPj1fNUVrXxVw/R5xWZmsBE6gneRp01TqtPKIgvYjjxy54U5jPd
         k9DisRipq/nQt/I93AECbeBOLgSYlZmDBrT6A4v431AcFon6XLX0WYJ+sR4h86hVTZaN
         6Fv/eVS2bybSB2F+mPF1+kjdldTfiFDYMoCOyrK85JdxhTVL24MLRcxEXbK/Vk2GV5GL
         vrIA==
X-Gm-Message-State: AOAM530EMN4PJA/agjq4E1hy9zCizZwr6GsZJwo3Hd/NP7tvYrSZmKAy
        oyPDoOtBFxMvvob/ocuVTeA=
X-Google-Smtp-Source: ABdhPJzxLL9O/vv5q7g4uKJg1jLrwwH/dKguiWxaWlWL7yocdL0b7uZRz3BcX2PMbW8OfHO4S6vfzQ==
X-Received: by 2002:a2e:944d:: with SMTP id o13mr7377262ljh.419.1632126167666;
        Mon, 20 Sep 2021 01:22:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16e2:8300::6? (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id o19sm1683678ljj.49.2021.09.20.01.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 01:22:47 -0700 (PDT)
Message-ID: <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com>
Date:   Mon, 20 Sep 2021 13:05:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
 <YUQyQgFAOFnBlcdP@atomide.com>
 <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
 <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
 <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com>
 <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
From:   Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
In-Reply-To: <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi dee Ho peeps & Thanks.

On 9/17/21 15:36, Grygorii Strashko wrote:
> 
> 
> On 17/09/2021 14:34, Vaittinen, Matti wrote:
>> Thanks a lot guys!
>>
>> On 9/17/21 14:01, Grygorii Strashko wrote:
>>>
>>>
>>> On 17/09/2021 13:57, Grygorii Strashko wrote:
>>>>
>>>>
>>>> On 17/09/2021 13:28, Vaittinen, Matti wrote:
>>>>> Hi deeee Ho Tony & All,
>>>>>
>>>>> On 9/17/21 09:14, Tony Lindgren wrote:
>>>>>> Hi,
>>>>>>
>>>>>> * Vaittinen, Matti <Matti.Vaittinen@fi.rohmeurope.com> [210916 
>>>>>> 09:15]:
>>>>>
>>>>>>> My beaglebone black (rev c) based test environment fails to boot 
>>>>>>> with
>>>>>>> v5.15-rc1. Boot succeeds with the v5.14.
>>>>>>>>> I added initcall_debug && changed the pr_debug() to pr_err() in
>> really_probe_debug(). Log from that run is attached. The
>> omap_reset_deassert() was not instrumented to print/delay for this run.
> 
> can you try just disable pruss_tm in am335x-bone-common.dtsi?
> 

I did try:

diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi 
b/arch/arm/boot/dts/am335x-bone-common.dtsi
index 
0ccdc7cd463bc62812f0f2797adb0f7bff1bd1b1..538af3fa0e6361923b40598fd33637c868298a83 
100644
--- a/arch/arm/boot/dts/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
@@ -402,5 +402,5 @@ &rtc {
  };

  &pruss_tm {
-	status = "okay";
+	status = "disabled";
  };

and the boot did no longer produce an oops.

NFS mount still hung. It took me a while to dig out that the cpsw_new.c 
was not compiled with my config. The TI_CPSW_SWITCHDEV was not set.

I did set the TI_CPSW_SWITCHDEV=y after which the bbb booted-up. 
Enabling the pruss_tm still produces an oops.

Finally, adding the udelay(100); (as Tony suggested) at the end of the 
omap_reset_deassert() did make the oops go away even when pruss_tm was 
enabled. I don't know what would be a proper fix though.

Best Regards
	Matti Vaittinen
