Return-Path: <linux-omap+bounces-170-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0BD8182FF
	for <lists+linux-omap@lfdr.de>; Tue, 19 Dec 2023 09:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61FD71C23789
	for <lists+linux-omap@lfdr.de>; Tue, 19 Dec 2023 08:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC07011716;
	Tue, 19 Dec 2023 08:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IvcTWN+4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9843F11702
	for <linux-omap@vger.kernel.org>; Tue, 19 Dec 2023 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55333eb0312so2162730a12.1
        for <linux-omap@vger.kernel.org>; Tue, 19 Dec 2023 00:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702973177; x=1703577977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHZZ1qBFLYk5D7ybnvL0vNBwkKCdL+WfKJkMFR2G4jQ=;
        b=IvcTWN+420WsmMQcZ+Ce8AZ7w11Au3LmG0wbK58RSbKxX63/cTJQkGx0xgCArXNcyP
         yDDAuXZ7tXPRj5TNcOnoCSVzvJNu7mzM1tE8rV0WWWqEmC4i3N4EmWwKt95CVxtDKAEl
         juyPD/IL8tHUIldkR03oaygtthIhQ9VFdpi/xPKnQStSiETd5YqGNzNc0co8NUWzLRQJ
         dT8uMUhzkFUJlCUiMwAYNWpKLSh+u+dzQV2zQtIHmtmgbCCl1KIqgb/P2K5uPcM4AJhd
         XHw4f6KIW5ub0VwNpe/SY2wciPVyu8k2zcX0DEJ9MnoE8olRVeGWfQhc0Hbgw5AnF/U5
         cYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702973177; x=1703577977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHZZ1qBFLYk5D7ybnvL0vNBwkKCdL+WfKJkMFR2G4jQ=;
        b=YRwTdyfSIITT+5UzSLPIMeGHMqHQNq7jWOw/dE3yFC9ZBZe38lzFOnzaJsp0PIO3ks
         Bwtcc5F5PX+GVeVMonSE7zvfzx2+Bk7p5DyGJx856i9a8ocg/e4JvpeHNck/2PcrF1SH
         2bBfKuBdutgymEJB4jG0dw74hLlzZDas6EsyhfJ9846bL2aZ0ZN+ohA2QI7pCBIrsGdj
         9V5Yh0T46UrIBTIHyVzlRdEDmIg3n50CjybMVxjgj0s/B8PJc+tqRC4lfWoMaVdsPLl2
         GmNEcrTZE1aubI9vV0+74QnjeiKfo83Wig3Bhl4v7Vw7Ub1qkFiX/6yVtKvhukSV41Bi
         OHww==
X-Gm-Message-State: AOJu0YxMFOvWxeNTV8H33T9v9P8sK8rmGCcjx7PfFjqt8ysnCNGA8Gad
	67eqzvYjBLvmTcY+19GsLHZJRg==
X-Google-Smtp-Source: AGHT+IFk7nCwJ3Cgygcv0PPxf8Nmoq++kFT+oSJXnVr98jtfa/yztBLisAU2VWlBWmsiTo2oa5jg+Q==
X-Received: by 2002:a50:cbc7:0:b0:54c:5d34:980c with SMTP id l7-20020a50cbc7000000b0054c5d34980cmr8989833edi.82.1702973176885;
        Tue, 19 Dec 2023 00:06:16 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id t16-20020aa7d710000000b00553533738f0sm1667914edq.57.2023.12.19.00.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 00:06:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel@pengutronix.de,
	Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-mips@vger.kernel.org,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	linux-tegra@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 00/15] memory: Convert to platform remove callback returning void
Date: Tue, 19 Dec 2023 09:06:12 +0100
Message-Id: <170297316309.10063.8435852209780151651.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702822744.git.u.kleine-koenig@pengutronix.de>
References: <cover.1702822744.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 17 Dec 2023 15:29:26 +0100, Uwe Kleine-König wrote:
> this series converts the platform drivers below drivers/memory to make
> use of .remove_new. See commit 5c5a7680e67b ("platform: Provide a remove
> callback that returns no value") for an extended explanation and the
> eventual goal. The TL;DR; is to make it harder for driver authors to
> leak resources without noticing.
> 
> This is merge window material. All patches are pairwise independent of
> each other so they can be applied individually. Still it would be great
> to let them go in all together.
> 
> [...]

Applied, thanks!

[01/15] memory: brcmstb_dpfe: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/431187eadbc7b0f2650d4e55111b3fff4720f867
[02/15] memory: brcmstb_memc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/f7754712ad6094de5be18674777b265ed4db2f45
[03/15] memory: emif: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/c8a53461990cb697ca494d6671fab9e196d20ce4
[04/15] memory: fsl-corenet-cf: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/021d044b0f9c9a09aa2f778e876e467a8810fb4a
[05/15] memory: fsl_ifc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/f17130855d51f24563a24cd957add769ad59eee9
[06/15] memory: jz4780-nemc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/9024fbbd77b4d73279bbbe2c748a4e4b414d50cc
[07/15] memory: mtk-smi: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/08c1aeaa45ce0fd18912e92c6705586c8aa5240f
[08/15] memory: omap-gpmc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/6a4edb1a4f61e28cc127cd06c470ce3599ee0d9c
[09/15] memory: renesas-rpc-if: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/961abc9f7d6771e8f13db1f4d8b0ffff3f0f41a4
[10/15] memory: exynos5422-dmc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/8013408e4912fb7e469bb8b14fd3a5c956257eec
[11/15] memory: stm32-fmc2-ebi: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/1455b6b0c83132960826d0e527a79a355e096a80
[12/15] memory: tegra186-emc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/dcefa0368458e9e20642dbd2608adae6b22e6464
[13/15] memory: tegra210-emc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/622fa819a2f0f3e6d8322a0b6d3177302ae937b6
[14/15] memory: ti-aemif: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/7852eb8c8ac7e0164b43cc5f8d8245cc3a037620
[15/15] memory: ti-emif-pm: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/365fcc03b6321f36eb7cbda8baa737238c387907

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

