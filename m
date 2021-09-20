Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1B941168A
	for <lists+linux-omap@lfdr.de>; Mon, 20 Sep 2021 16:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234845AbhITOPQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Sep 2021 10:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbhITOPP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Sep 2021 10:15:15 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0322C061762
        for <linux-omap@vger.kernel.org>; Mon, 20 Sep 2021 07:13:48 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id q26so30119187wrc.7
        for <linux-omap@vger.kernel.org>; Mon, 20 Sep 2021 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RyPWjhJavEnLnTk/ZY3T6RoRIu5tJ7dnIodg5ab5Fq4=;
        b=qNvpjxSFc0CBA2nCwDbOEj2STtOakHiTbmD5/1YeUVj5/KhzNGMnuWrVuNluM3TD/z
         nXQ1Q9sLPyDfBhVxArZz91nPyzPRipRi7Kz+EPxHsgPNWbcuiSH+T+A9otbFXOwJiIrI
         4GVk3z8EKT5n6OeD++CL2fgGvh7xqiznzL7+0ol36Bw+z6LORkKljVSBi0F4KyJET0XQ
         wmjSndgD5OwBvYn3ki+fT6BhSM1CUGV9BTPbVTTAeSwxvYAN+jkRvpBzwqOl32DC74tZ
         bmqruWy3UnTRw4PDm+KNYy61R3HLGk3U9svJ7o49Spg5G7Qn9b+rO2JpAPKGMXH0pSc3
         SiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RyPWjhJavEnLnTk/ZY3T6RoRIu5tJ7dnIodg5ab5Fq4=;
        b=Dt8UvJyKZ+svFlkzdnsfU/QfE9iRaiSVFrnuBBAKUZ0mlmdPTKuxAQdbEMzW5pbyI8
         B3oZ0ZYQqmwuzPkJ9Dbs8Vxs8nKO54JfR2WBEnZ+Z2cJ1codG8D+4YFVhWfaLuwRFIMO
         0fLOXCF5ln1ZFi8Dj77JHGSd83yLxhnHPbRb3M76FZ6k1J0kx/42YK9ApuF08i/S3yt4
         7QzYUS6gWR1eQ7XQ8GOc620FF4wruPQla+qewv9kFdLANqglAUdr09SyZ9E7sRpH5Hdi
         TgHBgn5pt6CMegBc35vvuLeTDfV4Nu8ztaz2X9TLwGB+RrBoBn/CoRJeRaeLfoXoKlu+
         4cNA==
X-Gm-Message-State: AOAM532W92KfVNATmSeezVaKnJn2vlw7hsJ8C6cPmz6bPBPDaCwV+xiK
        2Z1WWbD7kz/cVkypmH75OwBpNA==
X-Google-Smtp-Source: ABdhPJzFeo46lPTEjbj9FZ3QIUjAD+AZBNGfuSidO6eXOl7f14VVi1qHfHc6ZobjaAEZL2G4Zu/H1Q==
X-Received: by 2002:a1c:403:: with SMTP id 3mr24866812wme.161.1632147227143;
        Mon, 20 Sep 2021 07:13:47 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:aa8a:ef22:59c5:1bf3? ([2001:861:44c0:66c0:aa8a:ef22:59c5:1bf3])
        by smtp.gmail.com with ESMTPSA id n68sm20021573wmn.13.2021.09.20.07.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 07:13:46 -0700 (PDT)
Subject: Re: [PATCH 1/4] ARM: dts: dra7: add entry for bb2d module
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gowtham Tammana <g-tammana@ti.com>,
        Jyri Sarha <jsarha@ti.com>
References: <20210920125306.12347-1-narmstrong@baylibre.com>
 <20210920125306.12347-2-narmstrong@baylibre.com>
 <YUiOixF5/op1hXLf@atomide.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e0f0d78b-0678-7acf-32f4-3e40af918d1f@baylibre.com>
Date:   Mon, 20 Sep 2021 16:13:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUiOixF5/op1hXLf@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/09/2021 15:37, Tony Lindgren wrote:
> Hi,
> 
> * Neil Armstrong <narmstrong@baylibre.com> [210920 12:53]:
>> --- a/arch/arm/boot/dts/dra7.dtsi
>> +++ b/arch/arm/boot/dts/dra7.dtsi
>> @@ -965,6 +965,26 @@ hdmi: encoder@0 {
>>  			};
>>  		};
>>  
>> +		target-module@59000000 {
>> +			compatible = "ti,sysc-omap4", "ti,sysc";
>> +			reg = <0x59000020 0x4>;
>> +			reg-names = "rev";
>> +			clocks = <&dss_clkctrl DRA7_DSS_BB2D_CLKCTRL 0>;
>> +			clock-names = "fck";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges = <0x0 0x59000000 0x1000>;
>> +
>> +			bb2d: gpu@0 {
>> +				compatible = "vivante,gc";
>> +				reg = <0x0 0x0700>;
>> +				interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
>> +				clocks = <&dss_clkctrl DRA7_BB2D_CLKCTRL 0>;
>> +				clock-names = "core";
>> +				status = "disabled";
>> +			};
>> +		};
>> +
>>  		aes1_target: target-module@4b500000 {
>>  			compatible = "ti,sysc-omap2", "ti,sysc";
>>  			reg = <0x4b500080 0x4>,
> 
> How about just use the default for the bb2d node with is "okay"?
> That way there's no need set status = "okay" for each board file.
> 
> If there is no driver loaded, we idle the target-module anyways.

Yes you're right, I'll resend only this patch with no status property on bb2d node.

thanks,
Neil

> 
> Regards,
> 
> Tony
> 

