Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A66D1A5F57
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 04:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfICCgk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Sep 2019 22:36:40 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35313 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfICCgj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Sep 2019 22:36:39 -0400
Received: by mail-pg1-f196.google.com with SMTP id n4so8272355pgv.2
        for <linux-omap@vger.kernel.org>; Mon, 02 Sep 2019 19:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L9Qi+M+Wfaf1U8TRjwibswLZOw9HB36cymbwC0eqfSM=;
        b=SbBlLox6VA5lo4QBdr7EU4IFmOK2wkdOlrWpX7rp7b9z98JDKFr7jhYSu8cxHUtira
         OqDRPL3hGazDnfm4h20+t3Pc4ReRfwZ1JFu9ghUwLMIX3L7sUeXiDKLyUcrAZqNnZ+V2
         OQSWhAUkgOwoBHjULG3L6Qdc5badxLcR5lPbwRlDxlqFMUuRAi1MlSLwbN9U1oOQ/3An
         /SnJt7U3iNRvLnu7Zp47rNwZMGfC2Xp/jQHckUlqYUhWV/WEHxrddQn0+mevJ71kM9Ht
         1DLWgBy1SNMIxpQcBNpDVs2ZtBf5nwOLE75A9MVOcRM4HX+wdVEdkZhV6rOuBn5CKIPV
         so7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L9Qi+M+Wfaf1U8TRjwibswLZOw9HB36cymbwC0eqfSM=;
        b=i3k0B4itpb30C9VuDRtT6043N+FzCr92QJLwAYZrJ22KKbQZlMfTICIBqo5iyxM+Yi
         YPrfdWyXGnSyMbSSOCms0w5WevYqkYB/MDKNrmz3olUrYMdXhffXtrEJn7+xhHFwoebl
         n6l6tfGatxMXzhz/JU7THhl12HBdkAIcrp9SoqdWY8YdmNFcxvqxyaOjf+jr7errZszW
         IFMqWqqpOreyb9aB0mFX3R2neSvlNJMEzzXy1qV+S2t8KhVYCE8SYqWGuybv9HUFRC7y
         N7mOwXh8e9Ir/kEUruyzVr7gxTAY9pnzlWqlfie+Mx7UjysrfwjDIloMxe46qXQ2xbsM
         myyg==
X-Gm-Message-State: APjAAAVgbKaOmBdqdJIGRM08T5WDupYJ+uZJq5P+gPH7rQoxmGRAy7H7
        ZDetpdzug7DPfC64qCLlsyzNYQ==
X-Google-Smtp-Source: APXvYqxlVJJFchhXvA7ONZh5xaAIKIOegPi+eS0D1SpN4NtSB++8Z6ZMtzODFP5s2vBGYS9FoZrlHA==
X-Received: by 2002:a65:6401:: with SMTP id a1mr27925656pgv.42.1567478199018;
        Mon, 02 Sep 2019 19:36:39 -0700 (PDT)
Received: from localhost ([122.167.132.221])
        by smtp.gmail.com with ESMTPSA id x2sm9925510pfa.89.2019.09.02.19.36.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 19:36:37 -0700 (PDT)
Date:   Tue, 3 Sep 2019 08:06:35 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        =?utf-8?B?QW5kcsOp?= Roth <neolynx@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: Re: [RFC 4/5] ARM: dts: omap3-n950-n9: remove opp-v1 table
Message-ID: <20190903023635.44yf32jowpm3hgfp@vireshk-i7>
References: <cover.1567421750.git.hns@goldelico.com>
 <2f978667c1533e46e3a5df58871e9048f3eb74e9.1567421751.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f978667c1533e46e3a5df58871e9048f3eb74e9.1567421751.git.hns@goldelico.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 02-09-19, 12:55, H. Nikolaus Schaller wrote:
> With opp-v2 in omap36xx.dtsi and ti-cpufreq driver the
> 1GHz capability is automatically detected.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/arm/boot/dts/omap3-n950-n9.dtsi | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/omap3-n950-n9.dtsi b/arch/arm/boot/dts/omap3-n950-n9.dtsi
> index 5441e9ffdbb4..e98b0c615f19 100644
> --- a/arch/arm/boot/dts/omap3-n950-n9.dtsi
> +++ b/arch/arm/boot/dts/omap3-n950-n9.dtsi
> @@ -11,13 +11,6 @@
>  	cpus {
>  		cpu@0 {
>  			cpu0-supply = <&vcc>;
> -			operating-points = <
> -				/* kHz    uV */
> -				300000  1012500
> -				600000  1200000
> -				800000  1325000
> -				1000000	1375000
> -			>;
>  		};
>  	};

This should be merged with 2/5 ?

-- 
viresh
