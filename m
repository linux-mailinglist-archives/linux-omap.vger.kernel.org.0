Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A495B1A982B
	for <lists+linux-omap@lfdr.de>; Wed, 15 Apr 2020 11:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894721AbgDOJPe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Apr 2020 05:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2635969AbgDOJPa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Apr 2020 05:15:30 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DDEC061A0C
        for <linux-omap@vger.kernel.org>; Wed, 15 Apr 2020 02:15:29 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u15so2880355ljd.3
        for <linux-omap@vger.kernel.org>; Wed, 15 Apr 2020 02:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=69T9ZGqlIy7aImGgwrs75/hfGvsilwincFfwWiQFobg=;
        b=QmYfPFaxi91fzgnYBmzUnbNLZxOG0Qvv9XHtQXYm/D+sTky/Yc25iONfxBlY/7wqsB
         fRtQYUCgyxgK4p3vjoCdR1E4K1nsTfSz3bWGNyVBA7FGlzJ7W7xAZUor5i5MsgsA0hU6
         1sVmcbUlUP1cDxtb+3jC+HIaRfadnrNzRFcNUoV22EicSEE5dlVf6RJieO6E9yC3PemP
         qMb4hRiVMAXxE1MiwCuSopLulXmT+VCKUbpRSEH+BCrvLMZ4tKOYKabhdtdCWnXgNuRk
         9lpcy+vti6/lVgJJk2gVDZg/BOarCjaD0Ak6NlGy7RcdUdyYk3SImWtP+7AMtEZqo2NA
         +piQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=69T9ZGqlIy7aImGgwrs75/hfGvsilwincFfwWiQFobg=;
        b=qclmvKoFG5dxjqE5HBxOPu8WQjwZhYHu8/ddmBFihHqN0d2zrM1KIX0KKF7i60dI56
         /gVD/gq7aJNhZsNMb/4GBzpolaTSH/4f8wp5HLC4PnIYyK0HxeXfnP4GDsBqJETa5z/u
         Bq9FR8xZ+GAR2rtA75KxmvOG4+cxUBnigpnVlNgDsjjJtoyzAv2t7KSfLEsPCu+SHALz
         MwmG5/ab4fHyT3nCcBZdg3hwQGrQNReOu5YB5L+dIE5MG9+7VddrStetM9QJGMQ3YTVA
         q4wYj5crrrBaRgtQpuaIMcPGyZmcY2rHxseU8Ozj/YfbpOp2LW/eGj7WrA7pJnGJUQ64
         24Lg==
X-Gm-Message-State: AGi0Pub1IacNzrFulEEIH3vLEN1NusCa00tI+zeA9ju1kyyqhh/aT77j
        mk+g8x+maGT1ng4QDmoVOJ6NSfKDGKwp1A==
X-Google-Smtp-Source: APiQypJt4bgg1yrZutHX1jnCNUTiEGk5PA6dcO1xYRoqGEwzcnoywOgKJNgJRfEssnCyTOQijG6tmA==
X-Received: by 2002:a2e:6c0a:: with SMTP id h10mr2542581ljc.195.1586942127891;
        Wed, 15 Apr 2020 02:15:27 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:81b:6e8d:a1dd:9870:4166:dead? ([2a00:1fa0:81b:6e8d:a1dd:9870:4166:dead])
        by smtp.gmail.com with ESMTPSA id m13sm12192031lfk.12.2020.04.15.02.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 02:15:27 -0700 (PDT)
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>
References: <cover.1586939718.git.hns@goldelico.com>
 <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b6ffa74a-acef-f329-0d9e-981483499e16@cogentembedded.com>
Date:   Wed, 15 Apr 2020 12:15:17 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello!

On 15.04.2020 11:35, H. Nikolaus Schaller wrote:

> From: Jonathan Bakker <xc-racer2@live.ca>
> 
> to add support for SGX540 GPU.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
> index 2ad642f51fd9..e7fc709c0cca 100644
> --- a/arch/arm/boot/dts/s5pv210.dtsi
> +++ b/arch/arm/boot/dts/s5pv210.dtsi
> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
>   			#interrupt-cells = <1>;
>   		};
>   
> +		g3d: g3d@f3000000 {

    Should be named generically, "gpu@f3000000", according to the DT spec 0.2, 
section 2.2.2. It's either "gpu" or "display" TTBOMK...

[...]

MBR, Sergei
