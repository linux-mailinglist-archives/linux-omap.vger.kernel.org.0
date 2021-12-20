Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A0147A410
	for <lists+linux-omap@lfdr.de>; Mon, 20 Dec 2021 05:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237404AbhLTEUU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Dec 2021 23:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237401AbhLTEUU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 19 Dec 2021 23:20:20 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A715C061401
        for <linux-omap@vger.kernel.org>; Sun, 19 Dec 2021 20:20:20 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id q17so7050896plr.11
        for <linux-omap@vger.kernel.org>; Sun, 19 Dec 2021 20:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=idRrPNY8lT9qvJ1RX4lP6sDX0kRhviqifoOXKRGv1rY=;
        b=HI/6YkCt3ky43jRDNEN2lf6M22JE6+kU4T+uMtFrbfWX8vNs6ZusoVEID1nBzvAShn
         S5ZTX7Ta1P9uRa9kd/zrtJZhAtjeuHfoK85oJ1GeE2Dmh+H8ThxhaXpqrOXewiNLqOSQ
         o5L6XC7ifvxgGIy6Rq0q29P9z//gZq4zSt2X6nIn1ewKEtKWFLpzMiRl3XaW+2KCsW1H
         pPvGUDfqd1gxPY4X2f+ExStB3eDWtWpgRF3Gwdq/IRh/vjDpkLIdJ3PHlddVT2e1m4bx
         FfoHQpIUHyIZn/2ipJ3kPNh1POZNSW/ZlOciYn3QWbrNNhMav5W8xhcr1PHVOQgsXOqL
         pRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=idRrPNY8lT9qvJ1RX4lP6sDX0kRhviqifoOXKRGv1rY=;
        b=DnQ2zEoxJSOlcatcmY/Btu1wt1v/m3GX4QutB6M1xaMln0jViOktPYHdAPruOQOskg
         GiaosDEP3cZa+2l72jy7K0Ek92Y9FQswZuTx6xborlt33X3LgFrP6ka5MBSTeCtwNklG
         NpgKBsiPGwKGFYGvHII9yNlQNzdZx3DS97LnzEv5DCbVvu/7NUxT5o0GmkGHrY/TMcH6
         nVzhlBLugZAjtbBxxnSZupXgPGBpP9rlErhrnyvzsUaskjs+qmftzYBrgH0I8nU4kkOK
         xPOHL2uQZ48h3KzE9ff7weJBaVAGtrNtPRrNMGfI/laPvgnxo3vI/0wizoLG02YUll+i
         zvlA==
X-Gm-Message-State: AOAM530DNXmClyttRp4z18vedASXME7vXrfznTW6UgKtASqENGM/W1MR
        mDeve1TRWcD3Gyu6OCg2NjVSMg==
X-Google-Smtp-Source: ABdhPJzGZHTTmdWj0H2HUPNmPUFshIz7BAck3SWavB9iLe038KjqDHtpEYTn5mz3kFKV/RLuZgwPPw==
X-Received: by 2002:a17:90b:164c:: with SMTP id il12mr17891712pjb.241.1639974019397;
        Sun, 19 Dec 2021 20:20:19 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id n14sm6000281pgd.80.2021.12.19.20.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 20:20:18 -0800 (PST)
Date:   Mon, 20 Dec 2021 09:50:16 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     soc@kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Remove "spidev" nodes
Message-ID: <20211220042016.cnk332uthdxziv5a@vireshk-i7>
References: <20211217221232.3664417-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217221232.3664417-1-robh@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 17-12-21, 16:12, Rob Herring wrote:
> "spidev" is not a real device, but a Linux implementation detail. It has
> never been documented either. The kernel has WARNed on the use of it for
> over 6 years. Time to remove its usage from the tree.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Arnd, Olof, Can you please apply this directly.
> 
>  arch/arm/boot/dts/spear1310-evb.dts           | 16 ---------
>  arch/arm/boot/dts/spear1340-evb.dts           | 16 ---------

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
