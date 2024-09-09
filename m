Return-Path: <linux-omap+bounces-2157-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 465AF971CE7
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 16:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA05A283DED
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2024 14:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DC01BAEF0;
	Mon,  9 Sep 2024 14:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rLIW0/Jk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B631BAECA
	for <linux-omap@vger.kernel.org>; Mon,  9 Sep 2024 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725892850; cv=none; b=Ru2NIfxbaM3+ObULNvl3dQoraB9EIrb8deUOYDRkWQPm+WOgyamf6tlUEIXRbuFPCSMupf2K0S1EUcdJgUibzFlXKCpj26EKAXAmgGWzgkqHU3T6T8LWV8sY5Na/TRHMFYWZszXw9QIt5agFpxBI/irg7MFODAfDBXRXfurPtqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725892850; c=relaxed/simple;
	bh=j6oxQzX8ktpqjrs6WGYHwHeH+LPGWcQ0aJKKbbyaSq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YJ+5l7ki9QjNF1dX7lIUa/lTrRAvRAkPw/ati3+u9+kRXBFSWZbkyNoBR2E2b6XZYGxN464n1aAVkERMok7iVnVWZhEpRzEyZgGSlJlJg0hXdc259rRewV/01+UsSU4BKiinLQH2ajd616QJBlIM6Tn2qhN3ERpw9jkxsZfCV1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rLIW0/Jk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374c326c638so3327097f8f.2
        for <linux-omap@vger.kernel.org>; Mon, 09 Sep 2024 07:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725892841; x=1726497641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=82X6+XFTi+Q/yv+UThdKkxI3SwQWoYIK4L72wu4gwQ4=;
        b=rLIW0/JkmE8BdnzyTBoVN6bg2LAW6oaQk4zVn/kq3axV1x9rxEau3U5XYOmFDE5jUS
         Urktmoe1K7xwoJuy3KjVE8b0IqSKcFcT6zxxHaQCgXSdNt/2svJTlyAVBCN+RjSsM+bD
         fCghTgUXQNSvUJyvmWck4DFlsi3U4fVBug6uSU8G15hT4LpdAyrfKGOS4HgScnJLNcYa
         oAwTwDfuGVDZVsSNY1BYHHkjMh0gccxD9M1z2PfFNKz2vVgsstKQTh3jU+UsZjjp4Jgr
         VUygkd4oYUlTfE/AOaZRRJuP0CcJDn5IPHF2h03y8aeyuyR6wvng242ICqE7POH6iKn+
         +UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725892841; x=1726497641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82X6+XFTi+Q/yv+UThdKkxI3SwQWoYIK4L72wu4gwQ4=;
        b=bil/RANtKIa6QY3sUuQlFXhOIL3YonRcX5aeHow4vudQN8KMzKgoJ7/7aMA4wmcCfs
         bs9Ybr7v+N+c0yuW+8RTguPl+HLsgMaH+owtQs2edbOp0R4PaSISwk5g26NHNuozC7vV
         tcAfUvCvinFkw03lXYj1lL7XOaSChUxAkseUf6pAOVMUhbm/tZRM7RcMi/KSktF6l1Fs
         hh/sPwyKnajrtR2bqY9jV4y4cfLxwx6/keFTfsyhSWU4CBjK4Z1DUPceuEBtP89YCGZa
         jlcV6doT9kL2kG0L93PW+tK/0Pz2GBjSOJYWrRC6AwdtGnn/OMCLE989V6Oo93adxrba
         bJaw==
X-Forwarded-Encrypted: i=1; AJvYcCXQXTyQ7wXWCZ6zRQ88ZV8WYh16BHqjzzU6mZBwakmihnb/nqAMNF7fnmHvtkeiFD4ox0eKvMnnSObq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2CBbyGvjO+43QHfW9hWCKvu6pfIPdgXyIS3BSpDzl12dt84Uv
	XQP0TtTWuTnB0cxN0f8TD7WefdaZ+0wfGrJliZD8ZqfyJqZ9/znDnqJgHXImOLY=
X-Google-Smtp-Source: AGHT+IG/tidUOTx8WgWrffe1bCeYC36Mg+9mbyUzqrOK7dTn6rhdzj9E2aCuBZbB0dNbZQ5pqfa2gw==
X-Received: by 2002:a5d:4109:0:b0:371:9395:9c2d with SMTP id ffacd0b85a97d-378896c797cmr7683757f8f.55.1725892840595;
        Mon, 09 Sep 2024 07:40:40 -0700 (PDT)
Received: from localhost (p200300f65f01db004d6a46a6454a1385.dip0.t-ipconnect.de. [2003:f6:5f01:db00:4d6a:46a6:454a:1385])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b8bsm6222193f8f.54.2024.09.09.07.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 07:40:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH] clk: Switch back to struct platform_driver::remove()
Date: Mon,  9 Sep 2024 16:40:25 +0200
Message-ID: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=123187; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=j6oxQzX8ktpqjrs6WGYHwHeH+LPGWcQ0aJKKbbyaSq0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm3wjaZ/+DEsQEvQx4q8kHC/1zWdSGPkbk9b4jK Kp3JbyF4jiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZt8I2gAKCRCPgPtYfRL+ TtLwB/9ic6jqVLfrrWc5iow4w1mItKnR4Cd+k8F7Fy8hL+CiNr9i9yztkTVy3G0j/LF7YwI8TI3 x3H3cMs5ZrugShDZq48Vwt79SUDRnfUgKl2CIAOos1gZJ/umAsJbUsNkdDr1uA3vVoo0Njz9FSI +QhyQaWyBpP4HP0cTQaWJwNxfZ7SSAqnIyo/oXOvN61TXR59i6BIi0fDC/qKe1sbaF+oii6ydTE iAr+NrYcxHT41XerWLp1Ra3hGVFDS9ScD29fsfOz8E8nzg3By6OqYqSiXBlIeQHiTLM2TfEwo37 i48uv4BxbvJx3Mzr5QW8wlsQ69c09Gm7oxv4v+Y2QPEvdk2K
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all clk drivers to use .remove(), with the eventual goal to drop
struct platform_driver::remove_new(). As .remove() and .remove_new() have
the same prototypes, conversion is done by just changing the structure
member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I was lazy and created a single patch for all of clk. Please tell me if
I should split per vendor (or per-driver). Given that touches so many
drivers, I also stripped the individual maintainers and just kept the
mailing lists. I hope this doesn't prevent people to give feedback, but
otherwise the Cc: list gets Huge.

Best regards
Uwe

 drivers/clk/axs10x/i2s_pll_clock.c              | 2 +-
 drivers/clk/bcm/clk-bcm2711-dvp.c               | 2 +-
 drivers/clk/bcm/clk-bcm63xx-gate.c              | 2 +-
 drivers/clk/bcm/clk-raspberrypi.c               | 2 +-
 drivers/clk/clk-fixed-factor.c                  | 2 +-
 drivers/clk/clk-fixed-mmio.c                    | 2 +-
 drivers/clk/clk-fixed-rate.c                    | 2 +-
 drivers/clk/clk-palmas.c                        | 2 +-
 drivers/clk/clk-pwm.c                           | 2 +-
 drivers/clk/clk-s2mps11.c                       | 2 +-
 drivers/clk/clk-scpi.c                          | 2 +-
 drivers/clk/hisilicon/clk-hi3519.c              | 2 +-
 drivers/clk/hisilicon/clk-hi3559a.c             | 2 +-
 drivers/clk/hisilicon/crg-hi3516cv300.c         | 2 +-
 drivers/clk/hisilicon/crg-hi3798cv200.c         | 2 +-
 drivers/clk/imx/clk-imx8-acm.c                  | 2 +-
 drivers/clk/imx/clk-imx8mp-audiomix.c           | 2 +-
 drivers/clk/keystone/sci-clk.c                  | 2 +-
 drivers/clk/mediatek/clk-mt2701-aud.c           | 2 +-
 drivers/clk/mediatek/clk-mt2701-bdp.c           | 2 +-
 drivers/clk/mediatek/clk-mt2701-eth.c           | 2 +-
 drivers/clk/mediatek/clk-mt2701-g3d.c           | 2 +-
 drivers/clk/mediatek/clk-mt2701-hif.c           | 2 +-
 drivers/clk/mediatek/clk-mt2701-img.c           | 2 +-
 drivers/clk/mediatek/clk-mt2701-mm.c            | 2 +-
 drivers/clk/mediatek/clk-mt2701-vdec.c          | 2 +-
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c    | 2 +-
 drivers/clk/mediatek/clk-mt2712-bdp.c           | 2 +-
 drivers/clk/mediatek/clk-mt2712-img.c           | 2 +-
 drivers/clk/mediatek/clk-mt2712-jpgdec.c        | 2 +-
 drivers/clk/mediatek/clk-mt2712-mfg.c           | 2 +-
 drivers/clk/mediatek/clk-mt2712-mm.c            | 2 +-
 drivers/clk/mediatek/clk-mt2712-vdec.c          | 2 +-
 drivers/clk/mediatek/clk-mt2712-venc.c          | 2 +-
 drivers/clk/mediatek/clk-mt2712.c               | 2 +-
 drivers/clk/mediatek/clk-mt6765-audio.c         | 2 +-
 drivers/clk/mediatek/clk-mt6765-cam.c           | 2 +-
 drivers/clk/mediatek/clk-mt6765-img.c           | 2 +-
 drivers/clk/mediatek/clk-mt6765-mipi0a.c        | 2 +-
 drivers/clk/mediatek/clk-mt6765-mm.c            | 2 +-
 drivers/clk/mediatek/clk-mt6765-vcodec.c        | 2 +-
 drivers/clk/mediatek/clk-mt6779-aud.c           | 2 +-
 drivers/clk/mediatek/clk-mt6779-cam.c           | 2 +-
 drivers/clk/mediatek/clk-mt6779-img.c           | 2 +-
 drivers/clk/mediatek/clk-mt6779-ipe.c           | 2 +-
 drivers/clk/mediatek/clk-mt6779-mfg.c           | 2 +-
 drivers/clk/mediatek/clk-mt6779-mm.c            | 2 +-
 drivers/clk/mediatek/clk-mt6779-vdec.c          | 2 +-
 drivers/clk/mediatek/clk-mt6779-venc.c          | 2 +-
 drivers/clk/mediatek/clk-mt6779.c               | 2 +-
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c    | 2 +-
 drivers/clk/mediatek/clk-mt6795-infracfg.c      | 2 +-
 drivers/clk/mediatek/clk-mt6795-mfg.c           | 2 +-
 drivers/clk/mediatek/clk-mt6795-mm.c            | 2 +-
 drivers/clk/mediatek/clk-mt6795-pericfg.c       | 2 +-
 drivers/clk/mediatek/clk-mt6795-topckgen.c      | 2 +-
 drivers/clk/mediatek/clk-mt6795-vdecsys.c       | 2 +-
 drivers/clk/mediatek/clk-mt6795-vencsys.c       | 2 +-
 drivers/clk/mediatek/clk-mt6797-img.c           | 2 +-
 drivers/clk/mediatek/clk-mt6797-mm.c            | 2 +-
 drivers/clk/mediatek/clk-mt6797-vdec.c          | 2 +-
 drivers/clk/mediatek/clk-mt6797-venc.c          | 2 +-
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c    | 2 +-
 drivers/clk/mediatek/clk-mt7622-aud.c           | 2 +-
 drivers/clk/mediatek/clk-mt7622-eth.c           | 2 +-
 drivers/clk/mediatek/clk-mt7622-hif.c           | 2 +-
 drivers/clk/mediatek/clk-mt7622-infracfg.c      | 2 +-
 drivers/clk/mediatek/clk-mt7622.c               | 2 +-
 drivers/clk/mediatek/clk-mt7629-hif.c           | 2 +-
 drivers/clk/mediatek/clk-mt7981-eth.c           | 2 +-
 drivers/clk/mediatek/clk-mt7981-infracfg.c      | 2 +-
 drivers/clk/mediatek/clk-mt7981-topckgen.c      | 2 +-
 drivers/clk/mediatek/clk-mt7986-eth.c           | 2 +-
 drivers/clk/mediatek/clk-mt7986-infracfg.c      | 2 +-
 drivers/clk/mediatek/clk-mt7986-topckgen.c      | 2 +-
 drivers/clk/mediatek/clk-mt7988-eth.c           | 2 +-
 drivers/clk/mediatek/clk-mt7988-infracfg.c      | 2 +-
 drivers/clk/mediatek/clk-mt7988-topckgen.c      | 2 +-
 drivers/clk/mediatek/clk-mt7988-xfipll.c        | 2 +-
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c    | 2 +-
 drivers/clk/mediatek/clk-mt8135.c               | 2 +-
 drivers/clk/mediatek/clk-mt8167-aud.c           | 2 +-
 drivers/clk/mediatek/clk-mt8167-img.c           | 2 +-
 drivers/clk/mediatek/clk-mt8167-mfgcfg.c        | 2 +-
 drivers/clk/mediatek/clk-mt8167-mm.c            | 2 +-
 drivers/clk/mediatek/clk-mt8167-vdec.c          | 2 +-
 drivers/clk/mediatek/clk-mt8167.c               | 2 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c    | 2 +-
 drivers/clk/mediatek/clk-mt8173-img.c           | 2 +-
 drivers/clk/mediatek/clk-mt8173-infracfg.c      | 2 +-
 drivers/clk/mediatek/clk-mt8173-mm.c            | 2 +-
 drivers/clk/mediatek/clk-mt8173-pericfg.c       | 2 +-
 drivers/clk/mediatek/clk-mt8173-topckgen.c      | 2 +-
 drivers/clk/mediatek/clk-mt8173-vdecsys.c       | 2 +-
 drivers/clk/mediatek/clk-mt8173-vencsys.c       | 2 +-
 drivers/clk/mediatek/clk-mt8183-audio.c         | 2 +-
 drivers/clk/mediatek/clk-mt8183-cam.c           | 2 +-
 drivers/clk/mediatek/clk-mt8183-img.c           | 2 +-
 drivers/clk/mediatek/clk-mt8183-ipu0.c          | 2 +-
 drivers/clk/mediatek/clk-mt8183-ipu1.c          | 2 +-
 drivers/clk/mediatek/clk-mt8183-ipu_adl.c       | 2 +-
 drivers/clk/mediatek/clk-mt8183-ipu_conn.c      | 2 +-
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c        | 2 +-
 drivers/clk/mediatek/clk-mt8183-mm.c            | 2 +-
 drivers/clk/mediatek/clk-mt8183-vdec.c          | 2 +-
 drivers/clk/mediatek/clk-mt8183-venc.c          | 2 +-
 drivers/clk/mediatek/clk-mt8183.c               | 2 +-
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c    | 2 +-
 drivers/clk/mediatek/clk-mt8186-cam.c           | 2 +-
 drivers/clk/mediatek/clk-mt8186-img.c           | 2 +-
 drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c  | 2 +-
 drivers/clk/mediatek/clk-mt8186-infra_ao.c      | 2 +-
 drivers/clk/mediatek/clk-mt8186-ipe.c           | 2 +-
 drivers/clk/mediatek/clk-mt8186-mcu.c           | 2 +-
 drivers/clk/mediatek/clk-mt8186-mdp.c           | 2 +-
 drivers/clk/mediatek/clk-mt8186-mfg.c           | 2 +-
 drivers/clk/mediatek/clk-mt8186-mm.c            | 2 +-
 drivers/clk/mediatek/clk-mt8186-topckgen.c      | 2 +-
 drivers/clk/mediatek/clk-mt8186-vdec.c          | 2 +-
 drivers/clk/mediatek/clk-mt8186-venc.c          | 2 +-
 drivers/clk/mediatek/clk-mt8186-wpe.c           | 2 +-
 drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c | 2 +-
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c    | 2 +-
 drivers/clk/mediatek/clk-mt8188-cam.c           | 2 +-
 drivers/clk/mediatek/clk-mt8188-ccu.c           | 2 +-
 drivers/clk/mediatek/clk-mt8188-img.c           | 2 +-
 drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c  | 2 +-
 drivers/clk/mediatek/clk-mt8188-infra_ao.c      | 2 +-
 drivers/clk/mediatek/clk-mt8188-ipe.c           | 2 +-
 drivers/clk/mediatek/clk-mt8188-mfg.c           | 2 +-
 drivers/clk/mediatek/clk-mt8188-peri_ao.c       | 2 +-
 drivers/clk/mediatek/clk-mt8188-topckgen.c      | 2 +-
 drivers/clk/mediatek/clk-mt8188-vdec.c          | 2 +-
 drivers/clk/mediatek/clk-mt8188-vdo0.c          | 2 +-
 drivers/clk/mediatek/clk-mt8188-vdo1.c          | 2 +-
 drivers/clk/mediatek/clk-mt8188-venc.c          | 2 +-
 drivers/clk/mediatek/clk-mt8188-vpp0.c          | 2 +-
 drivers/clk/mediatek/clk-mt8188-vpp1.c          | 2 +-
 drivers/clk/mediatek/clk-mt8188-wpe.c           | 2 +-
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c    | 2 +-
 drivers/clk/mediatek/clk-mt8192-aud.c           | 2 +-
 drivers/clk/mediatek/clk-mt8192-cam.c           | 2 +-
 drivers/clk/mediatek/clk-mt8192-img.c           | 2 +-
 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c  | 2 +-
 drivers/clk/mediatek/clk-mt8192-ipe.c           | 2 +-
 drivers/clk/mediatek/clk-mt8192-mdp.c           | 2 +-
 drivers/clk/mediatek/clk-mt8192-mfg.c           | 2 +-
 drivers/clk/mediatek/clk-mt8192-mm.c            | 2 +-
 drivers/clk/mediatek/clk-mt8192-msdc.c          | 2 +-
 drivers/clk/mediatek/clk-mt8192-scp_adsp.c      | 2 +-
 drivers/clk/mediatek/clk-mt8192-vdec.c          | 2 +-
 drivers/clk/mediatek/clk-mt8192-venc.c          | 2 +-
 drivers/clk/mediatek/clk-mt8192.c               | 2 +-
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c    | 2 +-
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c    | 2 +-
 drivers/clk/mediatek/clk-mt8195-cam.c           | 2 +-
 drivers/clk/mediatek/clk-mt8195-ccu.c           | 2 +-
 drivers/clk/mediatek/clk-mt8195-img.c           | 2 +-
 drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c  | 2 +-
 drivers/clk/mediatek/clk-mt8195-infra_ao.c      | 2 +-
 drivers/clk/mediatek/clk-mt8195-ipe.c           | 2 +-
 drivers/clk/mediatek/clk-mt8195-mfg.c           | 2 +-
 drivers/clk/mediatek/clk-mt8195-peri_ao.c       | 2 +-
 drivers/clk/mediatek/clk-mt8195-scp_adsp.c      | 2 +-
 drivers/clk/mediatek/clk-mt8195-topckgen.c      | 2 +-
 drivers/clk/mediatek/clk-mt8195-vdec.c          | 2 +-
 drivers/clk/mediatek/clk-mt8195-vdo0.c          | 2 +-
 drivers/clk/mediatek/clk-mt8195-vdo1.c          | 2 +-
 drivers/clk/mediatek/clk-mt8195-venc.c          | 2 +-
 drivers/clk/mediatek/clk-mt8195-vpp0.c          | 2 +-
 drivers/clk/mediatek/clk-mt8195-vpp1.c          | 2 +-
 drivers/clk/mediatek/clk-mt8195-wpe.c           | 2 +-
 drivers/clk/mediatek/clk-mt8365-apu.c           | 2 +-
 drivers/clk/mediatek/clk-mt8365-cam.c           | 2 +-
 drivers/clk/mediatek/clk-mt8365-mfg.c           | 2 +-
 drivers/clk/mediatek/clk-mt8365-mm.c            | 2 +-
 drivers/clk/mediatek/clk-mt8365-vdec.c          | 2 +-
 drivers/clk/mediatek/clk-mt8365-venc.c          | 2 +-
 drivers/clk/mediatek/clk-mt8365.c               | 2 +-
 drivers/clk/mediatek/clk-mt8516-aud.c           | 2 +-
 drivers/clk/mediatek/clk-mt8516.c               | 2 +-
 drivers/clk/mmp/clk-audio.c                     | 2 +-
 drivers/clk/mvebu/armada-37xx-periph.c          | 2 +-
 drivers/clk/mvebu/armada-37xx-tbg.c             | 2 +-
 drivers/clk/mvebu/armada-37xx-xtal.c            | 2 +-
 drivers/clk/qcom/apcs-msm8916.c                 | 2 +-
 drivers/clk/qcom/apcs-sdx55.c                   | 2 +-
 drivers/clk/qcom/clk-cbf-8996.c                 | 2 +-
 drivers/clk/qcom/gcc-msm8960.c                  | 2 +-
 drivers/clk/renesas/rcar-usb2-clock-sel.c       | 2 +-
 drivers/clk/samsung/clk-exynos-audss.c          | 2 +-
 drivers/clk/samsung/clk-exynos-clkout.c         | 2 +-
 drivers/clk/starfive/clk-starfive-jh7110-isp.c  | 2 +-
 drivers/clk/starfive/clk-starfive-jh7110-vout.c | 2 +-
 drivers/clk/stm32/clk-stm32mp1.c                | 2 +-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c      | 2 +-
 drivers/clk/ti/adpll.c                          | 2 +-
 drivers/clk/x86/clk-fch.c                       | 2 +-
 drivers/clk/x86/clk-pmc-atom.c                  | 2 +-
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c      | 2 +-
 drivers/clk/xilinx/xlnx_vcu.c                   | 2 +-
 201 files changed, 201 insertions(+), 201 deletions(-)

diff --git a/drivers/clk/axs10x/i2s_pll_clock.c b/drivers/clk/axs10x/i2s_pll_clock.c
index 2334e6c334cf..9667ce898428 100644
--- a/drivers/clk/axs10x/i2s_pll_clock.c
+++ b/drivers/clk/axs10x/i2s_pll_clock.c
@@ -215,7 +215,7 @@ static struct platform_driver i2s_pll_clk_driver = {
 		.of_match_table = i2s_pll_clk_id,
 	},
 	.probe = i2s_pll_clk_probe,
-	.remove_new = i2s_pll_clk_remove,
+	.remove = i2s_pll_clk_remove,
 };
 module_platform_driver(i2s_pll_clk_driver);
 
diff --git a/drivers/clk/bcm/clk-bcm2711-dvp.c b/drivers/clk/bcm/clk-bcm2711-dvp.c
index 3cb235df9d37..e79720e85685 100644
--- a/drivers/clk/bcm/clk-bcm2711-dvp.c
+++ b/drivers/clk/bcm/clk-bcm2711-dvp.c
@@ -110,7 +110,7 @@ MODULE_DEVICE_TABLE(of, clk_dvp_dt_ids);
 
 static struct platform_driver clk_dvp_driver = {
 	.probe	= clk_dvp_probe,
-	.remove_new = clk_dvp_remove,
+	.remove = clk_dvp_remove,
 	.driver	= {
 		.name		= "brcm2711-dvp",
 		.of_match_table	= clk_dvp_dt_ids,
diff --git a/drivers/clk/bcm/clk-bcm63xx-gate.c b/drivers/clk/bcm/clk-bcm63xx-gate.c
index 36c7b302e396..d6d857474436 100644
--- a/drivers/clk/bcm/clk-bcm63xx-gate.c
+++ b/drivers/clk/bcm/clk-bcm63xx-gate.c
@@ -567,7 +567,7 @@ static const struct of_device_id clk_bcm63xx_dt_ids[] = {
 
 static struct platform_driver clk_bcm63xx = {
 	.probe = clk_bcm63xx_probe,
-	.remove_new = clk_bcm63xx_remove,
+	.remove = clk_bcm63xx_remove,
 	.driver = {
 		.name = "bcm63xx-clock",
 		.of_match_table = clk_bcm63xx_dt_ids,
diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 4d411408e4af..a18a8768feb4 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -458,7 +458,7 @@ static struct platform_driver raspberrypi_clk_driver = {
 		.of_match_table = raspberrypi_clk_match,
 	},
 	.probe          = raspberrypi_clk_probe,
-	.remove_new	= raspberrypi_clk_remove,
+	.remove		= raspberrypi_clk_remove,
 };
 module_platform_driver(raspberrypi_clk_driver);
 
diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index fe0500a1af3e..8fba63fc70c5 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -405,7 +405,7 @@ static struct platform_driver of_fixed_factor_clk_driver = {
 		.of_match_table = of_fixed_factor_clk_ids,
 	},
 	.probe = of_fixed_factor_clk_probe,
-	.remove_new = of_fixed_factor_clk_remove,
+	.remove = of_fixed_factor_clk_remove,
 };
 builtin_platform_driver(of_fixed_factor_clk_driver);
 #endif
diff --git a/drivers/clk/clk-fixed-mmio.c b/drivers/clk/clk-fixed-mmio.c
index 0e08cb22c196..3bfcf4cd98a2 100644
--- a/drivers/clk/clk-fixed-mmio.c
+++ b/drivers/clk/clk-fixed-mmio.c
@@ -91,7 +91,7 @@ static struct platform_driver of_fixed_mmio_clk_driver = {
 		.of_match_table = of_fixed_mmio_clk_ids,
 	},
 	.probe = of_fixed_mmio_clk_probe,
-	.remove_new = of_fixed_mmio_clk_remove,
+	.remove = of_fixed_mmio_clk_remove,
 };
 module_platform_driver(of_fixed_mmio_clk_driver);
 
diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index 3481eb8cdeb3..6b4f76b9c4da 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -232,7 +232,7 @@ static struct platform_driver of_fixed_clk_driver = {
 		.of_match_table = of_fixed_clk_ids,
 	},
 	.probe = of_fixed_clk_probe,
-	.remove_new = of_fixed_clk_remove,
+	.remove = of_fixed_clk_remove,
 };
 builtin_platform_driver(of_fixed_clk_driver);
 #endif
diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
index 5efb10776ae5..39049f62dbbb 100644
--- a/drivers/clk/clk-palmas.c
+++ b/drivers/clk/clk-palmas.c
@@ -281,7 +281,7 @@ static struct platform_driver palmas_clks_driver = {
 		.of_match_table = palmas_clks_of_match,
 	},
 	.probe = palmas_clks_probe,
-	.remove_new = palmas_clks_remove,
+	.remove = palmas_clks_remove,
 };
 
 module_platform_driver(palmas_clks_driver);
diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
index 3dd2b83d0404..bd4f21c22004 100644
--- a/drivers/clk/clk-pwm.c
+++ b/drivers/clk/clk-pwm.c
@@ -142,7 +142,7 @@ MODULE_DEVICE_TABLE(of, clk_pwm_dt_ids);
 
 static struct platform_driver clk_pwm_driver = {
 	.probe = clk_pwm_probe,
-	.remove_new = clk_pwm_remove,
+	.remove = clk_pwm_remove,
 	.driver = {
 		.name = "pwm-clock",
 		.of_match_table = clk_pwm_dt_ids,
diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 38c456540d1b..014db6386624 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -263,7 +263,7 @@ static struct platform_driver s2mps11_clk_driver = {
 		.name  = "s2mps11-clk",
 	},
 	.probe = s2mps11_clk_probe,
-	.remove_new = s2mps11_clk_remove,
+	.remove = s2mps11_clk_remove,
 	.id_table = s2mps11_clk_id,
 };
 module_platform_driver(s2mps11_clk_driver);
diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 108b697bd317..19d530d52e64 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -303,7 +303,7 @@ static struct platform_driver scpi_clocks_driver = {
 		.of_match_table = scpi_clocks_ids,
 	},
 	.probe = scpi_clocks_probe,
-	.remove_new = scpi_clocks_remove,
+	.remove = scpi_clocks_remove,
 };
 module_platform_driver(scpi_clocks_driver);
 
diff --git a/drivers/clk/hisilicon/clk-hi3519.c b/drivers/clk/hisilicon/clk-hi3519.c
index 141b727ff60d..0c50acd8543a 100644
--- a/drivers/clk/hisilicon/clk-hi3519.c
+++ b/drivers/clk/hisilicon/clk-hi3519.c
@@ -179,7 +179,7 @@ MODULE_DEVICE_TABLE(of, hi3519_clk_match_table);
 
 static struct platform_driver hi3519_clk_driver = {
 	.probe          = hi3519_clk_probe,
-	.remove_new	= hi3519_clk_remove,
+	.remove		= hi3519_clk_remove,
 	.driver         = {
 		.name   = "hi3519-clk",
 		.of_match_table = hi3519_clk_match_table,
diff --git a/drivers/clk/hisilicon/clk-hi3559a.c b/drivers/clk/hisilicon/clk-hi3559a.c
index 8646e9d352ed..f297fb25c512 100644
--- a/drivers/clk/hisilicon/clk-hi3559a.c
+++ b/drivers/clk/hisilicon/clk-hi3559a.c
@@ -817,7 +817,7 @@ static void hi3559av100_crg_remove(struct platform_device *pdev)
 
 static struct platform_driver hi3559av100_crg_driver = {
 	.probe		= hi3559av100_crg_probe,
-	.remove_new	= hi3559av100_crg_remove,
+	.remove		= hi3559av100_crg_remove,
 	.driver		= {
 		.name	= "hi3559av100-clock",
 		.of_match_table = hi3559av100_crg_match_table,
diff --git a/drivers/clk/hisilicon/crg-hi3516cv300.c b/drivers/clk/hisilicon/crg-hi3516cv300.c
index e602e65fbc38..b66140f74c51 100644
--- a/drivers/clk/hisilicon/crg-hi3516cv300.c
+++ b/drivers/clk/hisilicon/crg-hi3516cv300.c
@@ -294,7 +294,7 @@ static void hi3516cv300_crg_remove(struct platform_device *pdev)
 
 static struct platform_driver hi3516cv300_crg_driver = {
 	.probe          = hi3516cv300_crg_probe,
-	.remove_new	= hi3516cv300_crg_remove,
+	.remove		= hi3516cv300_crg_remove,
 	.driver         = {
 		.name   = "hi3516cv300-crg",
 		.of_match_table = hi3516cv300_crg_match_table,
diff --git a/drivers/clk/hisilicon/crg-hi3798cv200.c b/drivers/clk/hisilicon/crg-hi3798cv200.c
index f651b197e45a..8eabd1cc229f 100644
--- a/drivers/clk/hisilicon/crg-hi3798cv200.c
+++ b/drivers/clk/hisilicon/crg-hi3798cv200.c
@@ -377,7 +377,7 @@ static void hi3798cv200_crg_remove(struct platform_device *pdev)
 
 static struct platform_driver hi3798cv200_crg_driver = {
 	.probe          = hi3798cv200_crg_probe,
-	.remove_new	= hi3798cv200_crg_remove,
+	.remove		= hi3798cv200_crg_remove,
 	.driver         = {
 		.name   = "hi3798cv200-crg",
 		.of_match_table = hi3798cv200_crg_match_table,
diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
index 61d8c7e9ae0b..6c351050b82a 100644
--- a/drivers/clk/imx/clk-imx8-acm.c
+++ b/drivers/clk/imx/clk-imx8-acm.c
@@ -488,7 +488,7 @@ static struct platform_driver imx8_acm_clk_driver = {
 		.pm = &imx8_acm_pm_ops,
 	},
 	.probe = imx8_acm_clk_probe,
-	.remove_new = imx8_acm_clk_remove,
+	.remove = imx8_acm_clk_remove,
 };
 module_platform_driver(imx8_acm_clk_driver);
 
diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index 50ad5873c990..b2cb157703c5 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -454,7 +454,7 @@ MODULE_DEVICE_TABLE(of, clk_imx8mp_audiomix_of_match);
 
 static struct platform_driver clk_imx8mp_audiomix_driver = {
 	.probe	= clk_imx8mp_audiomix_probe,
-	.remove_new = clk_imx8mp_audiomix_remove,
+	.remove = clk_imx8mp_audiomix_remove,
 	.driver = {
 		.name = "imx8mp-audio-blk-ctrl",
 		.of_match_table = clk_imx8mp_audiomix_of_match,
diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 5cefc30a843e..c5894fc9395e 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -707,7 +707,7 @@ static void ti_sci_clk_remove(struct platform_device *pdev)
 
 static struct platform_driver ti_sci_clk_driver = {
 	.probe = ti_sci_clk_probe,
-	.remove_new = ti_sci_clk_remove,
+	.remove = ti_sci_clk_remove,
 	.driver = {
 		.name = "ti-sci-clk",
 		.of_match_table = of_match_ptr(ti_sci_clk_of_match),
diff --git a/drivers/clk/mediatek/clk-mt2701-aud.c b/drivers/clk/mediatek/clk-mt2701-aud.c
index 15859132c769..425c69cfb105 100644
--- a/drivers/clk/mediatek/clk-mt2701-aud.c
+++ b/drivers/clk/mediatek/clk-mt2701-aud.c
@@ -158,7 +158,7 @@ static void clk_mt2701_aud_remove(struct platform_device *pdev)
 
 static struct platform_driver clk_mt2701_aud_drv = {
 	.probe = clk_mt2701_aud_probe,
-	.remove_new = clk_mt2701_aud_remove,
+	.remove = clk_mt2701_aud_remove,
 	.driver = {
 		.name = "clk-mt2701-aud",
 		.of_match_table = of_match_clk_mt2701_aud,
diff --git a/drivers/clk/mediatek/clk-mt2701-bdp.c b/drivers/clk/mediatek/clk-mt2701-bdp.c
index e203dca70786..5da3eabffd3e 100644
--- a/drivers/clk/mediatek/clk-mt2701-bdp.c
+++ b/drivers/clk/mediatek/clk-mt2701-bdp.c
@@ -99,7 +99,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_bdp);
 
 static struct platform_driver clk_mt2701_bdp_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-bdp",
 		.of_match_table = of_match_clk_mt2701_bdp,
diff --git a/drivers/clk/mediatek/clk-mt2701-eth.c b/drivers/clk/mediatek/clk-mt2701-eth.c
index f6e1fdc9ee0a..608252e73f24 100644
--- a/drivers/clk/mediatek/clk-mt2701-eth.c
+++ b/drivers/clk/mediatek/clk-mt2701-eth.c
@@ -53,7 +53,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_eth);
 
 static struct platform_driver clk_mt2701_eth_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-eth",
 		.of_match_table = of_match_clk_mt2701_eth,
diff --git a/drivers/clk/mediatek/clk-mt2701-g3d.c b/drivers/clk/mediatek/clk-mt2701-g3d.c
index 5e04975433ea..b3e18b6db75d 100644
--- a/drivers/clk/mediatek/clk-mt2701-g3d.c
+++ b/drivers/clk/mediatek/clk-mt2701-g3d.c
@@ -50,7 +50,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_g3d);
 
 static struct platform_driver clk_mt2701_g3d_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-g3d",
 		.of_match_table = of_match_clk_mt2701_g3d,
diff --git a/drivers/clk/mediatek/clk-mt2701-hif.c b/drivers/clk/mediatek/clk-mt2701-hif.c
index c7b38d066403..000e00576052 100644
--- a/drivers/clk/mediatek/clk-mt2701-hif.c
+++ b/drivers/clk/mediatek/clk-mt2701-hif.c
@@ -50,7 +50,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_hif);
 
 static struct platform_driver clk_mt2701_hif_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-hif",
 		.of_match_table = of_match_clk_mt2701_hif,
diff --git a/drivers/clk/mediatek/clk-mt2701-img.c b/drivers/clk/mediatek/clk-mt2701-img.c
index ce13b79a7994..875594bc9dcb 100644
--- a/drivers/clk/mediatek/clk-mt2701-img.c
+++ b/drivers/clk/mediatek/clk-mt2701-img.c
@@ -47,7 +47,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_img);
 
 static struct platform_driver clk_mt2701_img_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-img",
 		.of_match_table = of_match_clk_mt2701_img,
diff --git a/drivers/clk/mediatek/clk-mt2701-mm.c b/drivers/clk/mediatek/clk-mt2701-mm.c
index 903592be56b5..bc68fa718878 100644
--- a/drivers/clk/mediatek/clk-mt2701-mm.c
+++ b/drivers/clk/mediatek/clk-mt2701-mm.c
@@ -80,7 +80,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt2701_mm_id_table);
 
 static struct platform_driver clk_mt2701_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt2701-mm",
 	},
diff --git a/drivers/clk/mediatek/clk-mt2701-vdec.c b/drivers/clk/mediatek/clk-mt2701-vdec.c
index 591091fb2151..94db86f8d0a4 100644
--- a/drivers/clk/mediatek/clk-mt2701-vdec.c
+++ b/drivers/clk/mediatek/clk-mt2701-vdec.c
@@ -52,7 +52,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_vdec);
 
 static struct platform_driver clk_mt2701_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-vdec",
 		.of_match_table = of_match_clk_mt2701_vdec,
diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 66987d205eee..a60622d251ff 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -156,7 +156,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_apmixed);
 
 static struct platform_driver clk_mt2712_apmixed_drv = {
 	.probe = clk_mt2712_apmixed_probe,
-	.remove_new = clk_mt2712_apmixed_remove,
+	.remove = clk_mt2712_apmixed_remove,
 	.driver = {
 		.name = "clk-mt2712-apmixed",
 		.of_match_table = of_match_clk_mt2712_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt2712-bdp.c b/drivers/clk/mediatek/clk-mt2712-bdp.c
index 93c5453e4392..c838311a0c51 100644
--- a/drivers/clk/mediatek/clk-mt2712-bdp.c
+++ b/drivers/clk/mediatek/clk-mt2712-bdp.c
@@ -69,7 +69,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_bdp);
 
 static struct platform_driver clk_mt2712_bdp_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2712-bdp",
 		.of_match_table = of_match_clk_mt2712_bdp,
diff --git a/drivers/clk/mediatek/clk-mt2712-img.c b/drivers/clk/mediatek/clk-mt2712-img.c
index 84abd0515fd2..bedebf86b0b5 100644
--- a/drivers/clk/mediatek/clk-mt2712-img.c
+++ b/drivers/clk/mediatek/clk-mt2712-img.c
@@ -47,7 +47,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_img);
 
 static struct platform_driver clk_mt2712_img_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2712-img",
 		.of_match_table = of_match_clk_mt2712_img,
diff --git a/drivers/clk/mediatek/clk-mt2712-jpgdec.c b/drivers/clk/mediatek/clk-mt2712-jpgdec.c
index 89be9082adba..1a73474b2f99 100644
--- a/drivers/clk/mediatek/clk-mt2712-jpgdec.c
+++ b/drivers/clk/mediatek/clk-mt2712-jpgdec.c
@@ -43,7 +43,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_jpgdec);
 
 static struct platform_driver clk_mt2712_jpgdec_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2712-jpgdec",
 		.of_match_table = of_match_clk_mt2712_jpgdec,
diff --git a/drivers/clk/mediatek/clk-mt2712-mfg.c b/drivers/clk/mediatek/clk-mt2712-mfg.c
index f7e0d0ebf665..c1bb45c7469e 100644
--- a/drivers/clk/mediatek/clk-mt2712-mfg.c
+++ b/drivers/clk/mediatek/clk-mt2712-mfg.c
@@ -42,7 +42,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_mfg);
 
 static struct platform_driver clk_mt2712_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2712-mfg",
 		.of_match_table = of_match_clk_mt2712_mfg,
diff --git a/drivers/clk/mediatek/clk-mt2712-mm.c b/drivers/clk/mediatek/clk-mt2712-mm.c
index 248529d3134d..32ecb949f7eb 100644
--- a/drivers/clk/mediatek/clk-mt2712-mm.c
+++ b/drivers/clk/mediatek/clk-mt2712-mm.c
@@ -121,7 +121,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt2712_mm_id_table);
 
 static struct platform_driver clk_mt2712_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt2712-mm",
 	},
diff --git a/drivers/clk/mediatek/clk-mt2712-vdec.c b/drivers/clk/mediatek/clk-mt2712-vdec.c
index a063f1f0aa52..a766342fbafa 100644
--- a/drivers/clk/mediatek/clk-mt2712-vdec.c
+++ b/drivers/clk/mediatek/clk-mt2712-vdec.c
@@ -55,7 +55,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_vdec);
 
 static struct platform_driver clk_mt2712_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2712-vdec",
 		.of_match_table = of_match_clk_mt2712_vdec,
diff --git a/drivers/clk/mediatek/clk-mt2712-venc.c b/drivers/clk/mediatek/clk-mt2712-venc.c
index 5b15df0a26f5..fc193dc8e8f6 100644
--- a/drivers/clk/mediatek/clk-mt2712-venc.c
+++ b/drivers/clk/mediatek/clk-mt2712-venc.c
@@ -44,7 +44,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2712_venc);
 
 static struct platform_driver clk_mt2712_venc_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2712-venc",
 		.of_match_table = of_match_clk_mt2712_venc,
diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index 91af45160aa4..964c92130e3c 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -993,7 +993,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt2712);
 
 static struct platform_driver clk_mt2712_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2712",
 		.of_match_table = of_match_clk_mt2712,
diff --git a/drivers/clk/mediatek/clk-mt6765-audio.c b/drivers/clk/mediatek/clk-mt6765-audio.c
index 3e481c697eff..2be1458087e6 100644
--- a/drivers/clk/mediatek/clk-mt6765-audio.c
+++ b/drivers/clk/mediatek/clk-mt6765-audio.c
@@ -69,7 +69,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6765_audio);
 
 static struct platform_driver clk_mt6765_audio_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6765-audio",
 		.of_match_table = of_match_clk_mt6765_audio,
diff --git a/drivers/clk/mediatek/clk-mt6765-cam.c b/drivers/clk/mediatek/clk-mt6765-cam.c
index fed9c789d9fa..2a7f30dc85bb 100644
--- a/drivers/clk/mediatek/clk-mt6765-cam.c
+++ b/drivers/clk/mediatek/clk-mt6765-cam.c
@@ -50,7 +50,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6765_cam);
 
 static struct platform_driver clk_mt6765_cam_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6765-cam",
 		.of_match_table = of_match_clk_mt6765_cam,
diff --git a/drivers/clk/mediatek/clk-mt6765-img.c b/drivers/clk/mediatek/clk-mt6765-img.c
index 34bb89ffd2dd..ff857852cfb0 100644
--- a/drivers/clk/mediatek/clk-mt6765-img.c
+++ b/drivers/clk/mediatek/clk-mt6765-img.c
@@ -46,7 +46,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6765_img);
 
 static struct platform_driver clk_mt6765_img_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6765-img",
 		.of_match_table = of_match_clk_mt6765_img,
diff --git a/drivers/clk/mediatek/clk-mt6765-mipi0a.c b/drivers/clk/mediatek/clk-mt6765-mipi0a.c
index 957eb494fee5..8261dfd12a9a 100644
--- a/drivers/clk/mediatek/clk-mt6765-mipi0a.c
+++ b/drivers/clk/mediatek/clk-mt6765-mipi0a.c
@@ -43,7 +43,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6765_mipi0a);
 
 static struct platform_driver clk_mt6765_mipi0a_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6765-mipi0a",
 		.of_match_table = of_match_clk_mt6765_mipi0a,
diff --git a/drivers/clk/mediatek/clk-mt6765-mm.c b/drivers/clk/mediatek/clk-mt6765-mm.c
index 099540fcfc76..e525919f9e81 100644
--- a/drivers/clk/mediatek/clk-mt6765-mm.c
+++ b/drivers/clk/mediatek/clk-mt6765-mm.c
@@ -72,7 +72,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6765_mm);
 
 static struct platform_driver clk_mt6765_mm_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6765-mm",
 		.of_match_table = of_match_clk_mt6765_mm,
diff --git a/drivers/clk/mediatek/clk-mt6765-vcodec.c b/drivers/clk/mediatek/clk-mt6765-vcodec.c
index 64f3451d0aee..f309d1090cda 100644
--- a/drivers/clk/mediatek/clk-mt6765-vcodec.c
+++ b/drivers/clk/mediatek/clk-mt6765-vcodec.c
@@ -45,7 +45,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6765_vcodec);
 
 static struct platform_driver clk_mt6765_vcodec_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6765-vcodec",
 		.of_match_table = of_match_clk_mt6765_vcodec,
diff --git a/drivers/clk/mediatek/clk-mt6779-aud.c b/drivers/clk/mediatek/clk-mt6779-aud.c
index 3d23b8e29af6..8ed318bd7765 100644
--- a/drivers/clk/mediatek/clk-mt6779-aud.c
+++ b/drivers/clk/mediatek/clk-mt6779-aud.c
@@ -104,7 +104,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_aud);
 
 static struct platform_driver clk_mt6779_aud_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-aud",
 		.of_match_table = of_match_clk_mt6779_aud,
diff --git a/drivers/clk/mediatek/clk-mt6779-cam.c b/drivers/clk/mediatek/clk-mt6779-cam.c
index e76b2c4f548e..f397b55606de 100644
--- a/drivers/clk/mediatek/clk-mt6779-cam.c
+++ b/drivers/clk/mediatek/clk-mt6779-cam.c
@@ -55,7 +55,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_cam);
 
 static struct platform_driver clk_mt6779_cam_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-cam",
 		.of_match_table = of_match_clk_mt6779_cam,
diff --git a/drivers/clk/mediatek/clk-mt6779-img.c b/drivers/clk/mediatek/clk-mt6779-img.c
index 0c5971f3966a..474a59a4ca9e 100644
--- a/drivers/clk/mediatek/clk-mt6779-img.c
+++ b/drivers/clk/mediatek/clk-mt6779-img.c
@@ -47,7 +47,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_img);
 
 static struct platform_driver clk_mt6779_img_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-img",
 		.of_match_table = of_match_clk_mt6779_img,
diff --git a/drivers/clk/mediatek/clk-mt6779-ipe.c b/drivers/clk/mediatek/clk-mt6779-ipe.c
index 9c1a9f1b0f3e..c2314654f43a 100644
--- a/drivers/clk/mediatek/clk-mt6779-ipe.c
+++ b/drivers/clk/mediatek/clk-mt6779-ipe.c
@@ -49,7 +49,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_ipe);
 
 static struct platform_driver clk_mt6779_ipe_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-ipe",
 		.of_match_table = of_match_clk_mt6779_ipe,
diff --git a/drivers/clk/mediatek/clk-mt6779-mfg.c b/drivers/clk/mediatek/clk-mt6779-mfg.c
index 3cc82b59117f..21793cb6e6e3 100644
--- a/drivers/clk/mediatek/clk-mt6779-mfg.c
+++ b/drivers/clk/mediatek/clk-mt6779-mfg.c
@@ -44,7 +44,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_mfg);
 
 static struct platform_driver clk_mt6779_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-mfg",
 		.of_match_table = of_match_clk_mt6779_mfg,
diff --git a/drivers/clk/mediatek/clk-mt6779-mm.c b/drivers/clk/mediatek/clk-mt6779-mm.c
index 97d437a6f98f..30bbab308388 100644
--- a/drivers/clk/mediatek/clk-mt6779-mm.c
+++ b/drivers/clk/mediatek/clk-mt6779-mm.c
@@ -98,7 +98,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt6779_mm_id_table);
 
 static struct platform_driver clk_mt6779_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt6779-mm",
 	},
diff --git a/drivers/clk/mediatek/clk-mt6779-vdec.c b/drivers/clk/mediatek/clk-mt6779-vdec.c
index a9122e627aa5..458d012f023c 100644
--- a/drivers/clk/mediatek/clk-mt6779-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6779-vdec.c
@@ -56,7 +56,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_vdec);
 
 static struct platform_driver clk_mt6779_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-vdec",
 		.of_match_table = of_match_clk_mt6779_vdec,
diff --git a/drivers/clk/mediatek/clk-mt6779-venc.c b/drivers/clk/mediatek/clk-mt6779-venc.c
index 2cd032648eb1..70cebc274031 100644
--- a/drivers/clk/mediatek/clk-mt6779-venc.c
+++ b/drivers/clk/mediatek/clk-mt6779-venc.c
@@ -47,7 +47,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6779_venc);
 
 static struct platform_driver clk_mt6779_venc_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-venc",
 		.of_match_table = of_match_clk_mt6779_venc,
diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 819253b97a02..86732f5acf93 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -1305,7 +1305,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6779);
 
 static struct platform_driver clk_mt6779_infra_drv  = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-infra",
 		.of_match_table = of_match_clk_mt6779_infra,
diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 8c65974ed9b8..91665d7f125e 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -201,7 +201,7 @@ static void clk_mt6795_apmixed_remove(struct platform_device *pdev)
 
 static struct platform_driver clk_mt6795_apmixed_drv = {
 	.probe = clk_mt6795_apmixed_probe,
-	.remove_new = clk_mt6795_apmixed_remove,
+	.remove = clk_mt6795_apmixed_remove,
 	.driver = {
 		.name = "clk-mt6795-apmixed",
 		.of_match_table = of_match_clk_mt6795_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index 06d7fdf3098b..e4559569f5b0 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -144,7 +144,7 @@ static struct platform_driver clk_mt6795_infracfg_drv = {
 		.of_match_table = of_match_clk_mt6795_infracfg,
 	},
 	.probe = clk_mt6795_infracfg_probe,
-	.remove_new = clk_mt6795_infracfg_remove,
+	.remove = clk_mt6795_infracfg_remove,
 };
 module_platform_driver(clk_mt6795_infracfg_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt6795-mfg.c b/drivers/clk/mediatek/clk-mt6795-mfg.c
index dff6a6ded837..1d658bb19e82 100644
--- a/drivers/clk/mediatek/clk-mt6795-mfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-mfg.c
@@ -43,7 +43,7 @@ static struct platform_driver clk_mt6795_mfg_drv = {
 		.of_match_table = of_match_clk_mt6795_mfg,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt6795_mfg_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt6795-mm.c b/drivers/clk/mediatek/clk-mt6795-mm.c
index dd1708d689dc..733d0e2021fc 100644
--- a/drivers/clk/mediatek/clk-mt6795-mm.c
+++ b/drivers/clk/mediatek/clk-mt6795-mm.c
@@ -93,7 +93,7 @@ static struct platform_driver clk_mt6795_mm_drv = {
 	},
 	.id_table = clk_mt6795_mm_id_table,
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 };
 module_platform_driver(clk_mt6795_mm_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index 3f6bea418a5a..d48240eb2a67 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -153,7 +153,7 @@ static struct platform_driver clk_mt6795_pericfg_drv = {
 		.of_match_table = of_match_clk_mt6795_pericfg,
 	},
 	.probe = clk_mt6795_pericfg_probe,
-	.remove_new = clk_mt6795_pericfg_remove,
+	.remove = clk_mt6795_pericfg_remove,
 };
 module_platform_driver(clk_mt6795_pericfg_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt6795-topckgen.c b/drivers/clk/mediatek/clk-mt6795-topckgen.c
index be595853a925..9c6d63a80b19 100644
--- a/drivers/clk/mediatek/clk-mt6795-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt6795-topckgen.c
@@ -547,7 +547,7 @@ static struct platform_driver clk_mt6795_topckgen_drv = {
 		.of_match_table = of_match_clk_mt6795_topckgen,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt6795_topckgen_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt6795-vdecsys.c b/drivers/clk/mediatek/clk-mt6795-vdecsys.c
index 9e91d6f7f5bf..f2968f859dca 100644
--- a/drivers/clk/mediatek/clk-mt6795-vdecsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-vdecsys.c
@@ -44,7 +44,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_vdecsys);
 
 static struct platform_driver clk_mt6795_vdecsys_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6795-vdecsys",
 		.of_match_table = of_match_clk_mt6795_vdecsys,
diff --git a/drivers/clk/mediatek/clk-mt6795-vencsys.c b/drivers/clk/mediatek/clk-mt6795-vencsys.c
index bd81e80b744f..2f8d48da1a85 100644
--- a/drivers/clk/mediatek/clk-mt6795-vencsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-vencsys.c
@@ -43,7 +43,7 @@ static struct platform_driver clk_mt6795_vencsys_drv = {
 		.of_match_table = of_match_clk_mt6795_vencsys,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt6795_vencsys_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt6797-img.c b/drivers/clk/mediatek/clk-mt6797-img.c
index 0ec0cf2154dc..338c69234f24 100644
--- a/drivers/clk/mediatek/clk-mt6797-img.c
+++ b/drivers/clk/mediatek/clk-mt6797-img.c
@@ -43,7 +43,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6797_img);
 
 static struct platform_driver clk_mt6797_img_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6797-img",
 		.of_match_table = of_match_clk_mt6797_img,
diff --git a/drivers/clk/mediatek/clk-mt6797-mm.c b/drivers/clk/mediatek/clk-mt6797-mm.c
index f5701e965792..ddb40b8a1a7d 100644
--- a/drivers/clk/mediatek/clk-mt6797-mm.c
+++ b/drivers/clk/mediatek/clk-mt6797-mm.c
@@ -93,7 +93,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt6797_mm_id_table);
 
 static struct platform_driver clk_mt6797_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt6797-mm",
 	},
diff --git a/drivers/clk/mediatek/clk-mt6797-vdec.c b/drivers/clk/mediatek/clk-mt6797-vdec.c
index c967d5e25c7d..d832f48123f5 100644
--- a/drivers/clk/mediatek/clk-mt6797-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6797-vdec.c
@@ -54,7 +54,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6797_vdec);
 
 static struct platform_driver clk_mt6797_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6797-vdec",
 		.of_match_table = of_match_clk_mt6797_vdec,
diff --git a/drivers/clk/mediatek/clk-mt6797-venc.c b/drivers/clk/mediatek/clk-mt6797-venc.c
index f6fac5db65b0..fd4446f4a9d7 100644
--- a/drivers/clk/mediatek/clk-mt6797-venc.c
+++ b/drivers/clk/mediatek/clk-mt6797-venc.c
@@ -45,7 +45,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt6797_venc);
 
 static struct platform_driver clk_mt6797_venc_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6797-venc",
 		.of_match_table = of_match_clk_mt6797_venc,
diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 1b8f859b6b6c..2350592d9a93 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -137,7 +137,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_apmixed);
 
 static struct platform_driver clk_mt7622_apmixed_drv = {
 	.probe = clk_mt7622_apmixed_probe,
-	.remove_new = clk_mt7622_apmixed_remove,
+	.remove = clk_mt7622_apmixed_remove,
 	.driver = {
 		.name = "clk-mt7622-apmixed",
 		.of_match_table = of_match_clk_mt7622_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt7622-aud.c b/drivers/clk/mediatek/clk-mt7622-aud.c
index b7bf626e4d14..931a0598e598 100644
--- a/drivers/clk/mediatek/clk-mt7622-aud.c
+++ b/drivers/clk/mediatek/clk-mt7622-aud.c
@@ -149,7 +149,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_aud);
 
 static struct platform_driver clk_mt7622_aud_drv = {
 	.probe = clk_mt7622_aud_probe,
-	.remove_new = clk_mt7622_aud_remove,
+	.remove = clk_mt7622_aud_remove,
 	.driver = {
 		.name = "clk-mt7622-aud",
 		.of_match_table = of_match_clk_mt7622_aud,
diff --git a/drivers/clk/mediatek/clk-mt7622-eth.c b/drivers/clk/mediatek/clk-mt7622-eth.c
index fa4876317a8d..1c1033a92c46 100644
--- a/drivers/clk/mediatek/clk-mt7622-eth.c
+++ b/drivers/clk/mediatek/clk-mt7622-eth.c
@@ -79,7 +79,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_eth);
 
 static struct platform_driver clk_mt7622_eth_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7622-eth",
 		.of_match_table = of_match_clk_mt7622_eth,
diff --git a/drivers/clk/mediatek/clk-mt7622-hif.c b/drivers/clk/mediatek/clk-mt7622-hif.c
index 8e57582454c2..5bcfe12c4fd0 100644
--- a/drivers/clk/mediatek/clk-mt7622-hif.c
+++ b/drivers/clk/mediatek/clk-mt7622-hif.c
@@ -91,7 +91,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_hif);
 
 static struct platform_driver clk_mt7622_hif_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7622-hif",
 		.of_match_table = of_match_clk_mt7622_hif,
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index 6bc911cb29a6..cfdf3b07c3e0 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -118,7 +118,7 @@ static struct platform_driver clk_mt7622_infracfg_drv = {
 		.of_match_table = of_match_clk_mt7622_infracfg,
 	},
 	.probe = clk_mt7622_infracfg_probe,
-	.remove_new = clk_mt7622_infracfg_remove,
+	.remove = clk_mt7622_infracfg_remove,
 };
 module_platform_driver(clk_mt7622_infracfg_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index 27781a62a131..f62b03abab4f 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -524,7 +524,7 @@ static struct platform_driver clk_mt7622_drv = {
 		.of_match_table = of_match_clk_mt7622,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt7622_drv)
 
diff --git a/drivers/clk/mediatek/clk-mt7629-hif.c b/drivers/clk/mediatek/clk-mt7629-hif.c
index 96d1a82ad75f..3fdc2d7d4274 100644
--- a/drivers/clk/mediatek/clk-mt7629-hif.c
+++ b/drivers/clk/mediatek/clk-mt7629-hif.c
@@ -86,7 +86,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt7629_hif);
 
 static struct platform_driver clk_mt7629_hif_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7629-hif",
 		.of_match_table = of_match_clk_mt7629_hif,
diff --git a/drivers/clk/mediatek/clk-mt7981-eth.c b/drivers/clk/mediatek/clk-mt7981-eth.c
index e8cb247db0ce..906aec9ddff5 100644
--- a/drivers/clk/mediatek/clk-mt7981-eth.c
+++ b/drivers/clk/mediatek/clk-mt7981-eth.c
@@ -107,7 +107,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_eth);
 
 static struct platform_driver clk_mt7981_eth_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7981-eth",
 		.of_match_table = of_match_clk_mt7981_eth,
diff --git a/drivers/clk/mediatek/clk-mt7981-infracfg.c b/drivers/clk/mediatek/clk-mt7981-infracfg.c
index b2b055151297..0487b6bb80ae 100644
--- a/drivers/clk/mediatek/clk-mt7981-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7981-infracfg.c
@@ -197,7 +197,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_infracfg);
 
 static struct platform_driver clk_mt7981_infracfg_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7981-infracfg",
 		.of_match_table = of_match_clk_mt7981_infracfg,
diff --git a/drivers/clk/mediatek/clk-mt7981-topckgen.c b/drivers/clk/mediatek/clk-mt7981-topckgen.c
index 72f2f4f30e85..1943f11e47c1 100644
--- a/drivers/clk/mediatek/clk-mt7981-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt7981-topckgen.c
@@ -413,7 +413,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt7981_topckgen);
 
 static struct platform_driver clk_mt7981_topckgen_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7981-topckgen",
 		.of_match_table = of_match_clk_mt7981_topckgen,
diff --git a/drivers/clk/mediatek/clk-mt7986-eth.c b/drivers/clk/mediatek/clk-mt7986-eth.c
index 7ab78e0f49a1..4514d42c0829 100644
--- a/drivers/clk/mediatek/clk-mt7986-eth.c
+++ b/drivers/clk/mediatek/clk-mt7986-eth.c
@@ -92,7 +92,7 @@ static struct platform_driver clk_mt7986_eth_drv = {
 		.of_match_table = of_match_clk_mt7986_eth,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt7986_eth_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt7986-infracfg.c b/drivers/clk/mediatek/clk-mt7986-infracfg.c
index cb8ab3e53abf..732c65e616de 100644
--- a/drivers/clk/mediatek/clk-mt7986-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7986-infracfg.c
@@ -177,7 +177,7 @@ static struct platform_driver clk_mt7986_infracfg_drv = {
 		.of_match_table = of_match_clk_mt7986_infracfg,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt7986_infracfg_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt7986-topckgen.c b/drivers/clk/mediatek/clk-mt7986-topckgen.c
index b644b4ca4710..2dd30da306d9 100644
--- a/drivers/clk/mediatek/clk-mt7986-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt7986-topckgen.c
@@ -306,7 +306,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt7986_topckgen);
 
 static struct platform_driver clk_mt7986_topckgen_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7986-topckgen",
 		.of_match_table = of_match_clk_mt7986_topckgen,
diff --git a/drivers/clk/mediatek/clk-mt7988-eth.c b/drivers/clk/mediatek/clk-mt7988-eth.c
index adf4a9d39b38..7d9463688be2 100644
--- a/drivers/clk/mediatek/clk-mt7988-eth.c
+++ b/drivers/clk/mediatek/clk-mt7988-eth.c
@@ -142,7 +142,7 @@ static struct platform_driver clk_mt7988_eth_drv = {
 		.of_match_table = of_match_clk_mt7988_eth,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt7988_eth_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
index 6c2bebabb4de..ef8267319d91 100644
--- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
@@ -292,7 +292,7 @@ static struct platform_driver clk_mt7988_infracfg_drv = {
 		.of_match_table = of_match_clk_mt7988_infracfg,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt7988_infracfg_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt7988-topckgen.c b/drivers/clk/mediatek/clk-mt7988-topckgen.c
index 7300e9694582..50e02cc7a214 100644
--- a/drivers/clk/mediatek/clk-mt7988-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt7988-topckgen.c
@@ -315,7 +315,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_topckgen);
 
 static struct platform_driver clk_mt7988_topckgen_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7988-topckgen",
 		.of_match_table = of_match_clk_mt7988_topckgen,
diff --git a/drivers/clk/mediatek/clk-mt7988-xfipll.c b/drivers/clk/mediatek/clk-mt7988-xfipll.c
index 9b9ca5471158..f941e4d3ef28 100644
--- a/drivers/clk/mediatek/clk-mt7988-xfipll.c
+++ b/drivers/clk/mediatek/clk-mt7988-xfipll.c
@@ -74,7 +74,7 @@ static struct platform_driver clk_mt7988_xfipll_drv = {
 		.of_match_table = of_match_clk_mt7988_xfipll,
 	},
 	.probe = clk_mt7988_xfipll_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt7988_xfipll_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index 41bb2d2e2ea7..bdadc35c64cb 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -93,7 +93,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8135_apmixed);
 
 static struct platform_driver clk_mt8135_apmixed_drv = {
 	.probe = clk_mt8135_apmixed_probe,
-	.remove_new = clk_mt8135_apmixed_remove,
+	.remove = clk_mt8135_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8135-apmixed",
 		.of_match_table = of_match_clk_mt8135_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
index 019af88d7f9c..084e48a554c2 100644
--- a/drivers/clk/mediatek/clk-mt8135.c
+++ b/drivers/clk/mediatek/clk-mt8135.c
@@ -558,7 +558,7 @@ static struct platform_driver clk_mt8135_drv = {
 		.of_match_table = of_match_clk_mt8135,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt8135_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt8167-aud.c b/drivers/clk/mediatek/clk-mt8167-aud.c
index d1a42ff549c1..d6cff4bdf4cb 100644
--- a/drivers/clk/mediatek/clk-mt8167-aud.c
+++ b/drivers/clk/mediatek/clk-mt8167-aud.c
@@ -54,7 +54,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_audsys);
 
 static struct platform_driver clk_mt8167_audsys_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8167-audsys",
 		.of_match_table = of_match_clk_mt8167_audsys,
diff --git a/drivers/clk/mediatek/clk-mt8167-img.c b/drivers/clk/mediatek/clk-mt8167-img.c
index 888ac3bdeacb..42d38ae94b69 100644
--- a/drivers/clk/mediatek/clk-mt8167-img.c
+++ b/drivers/clk/mediatek/clk-mt8167-img.c
@@ -46,7 +46,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_imgsys);
 
 static struct platform_driver clk_mt8167_imgsys_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8167-imgsys",
 		.of_match_table = of_match_clk_mt8167_imgsys,
diff --git a/drivers/clk/mediatek/clk-mt8167-mfgcfg.c b/drivers/clk/mediatek/clk-mt8167-mfgcfg.c
index e873766f130c..1ef37a3e6851 100644
--- a/drivers/clk/mediatek/clk-mt8167-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8167-mfgcfg.c
@@ -44,7 +44,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_mfgcfg);
 
 static struct platform_driver clk_mt8167_mfgcfg_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8167-mfgcfg",
 		.of_match_table = of_match_clk_mt8167_mfgcfg,
diff --git a/drivers/clk/mediatek/clk-mt8167-mm.c b/drivers/clk/mediatek/clk-mt8167-mm.c
index 38deedffaacf..cef66ee836f3 100644
--- a/drivers/clk/mediatek/clk-mt8167-mm.c
+++ b/drivers/clk/mediatek/clk-mt8167-mm.c
@@ -85,7 +85,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt8167_mm_id_table);
 
 static struct platform_driver clk_mt8167_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt8167-mm",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8167-vdec.c b/drivers/clk/mediatek/clk-mt8167-vdec.c
index c3c892bb8334..e3769bc556a9 100644
--- a/drivers/clk/mediatek/clk-mt8167-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8167-vdec.c
@@ -53,7 +53,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_vdec);
 
 static struct platform_driver clk_mt8167_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8167-vdecsys",
 		.of_match_table = of_match_clk_mt8167_vdec,
diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index 5c94995f859c..c64d918c37de 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -887,7 +887,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8167);
 
 static struct platform_driver clk_mt8167_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8167",
 		.of_match_table = of_match_clk_mt8167,
diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index 6cab483b8e1e..95385bb67d55 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -207,7 +207,7 @@ static void clk_mt8173_apmixed_remove(struct platform_device *pdev)
 
 static struct platform_driver clk_mt8173_apmixed_drv = {
 	.probe = clk_mt8173_apmixed_probe,
-	.remove_new = clk_mt8173_apmixed_remove,
+	.remove = clk_mt8173_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8173-apmixed",
 		.of_match_table = of_match_clk_mt8173_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt8173-img.c b/drivers/clk/mediatek/clk-mt8173-img.c
index 1011b9ab3dad..6db2b9ab2bc9 100644
--- a/drivers/clk/mediatek/clk-mt8173-img.c
+++ b/drivers/clk/mediatek/clk-mt8173-img.c
@@ -44,7 +44,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_imgsys);
 
 static struct platform_driver clk_mt8173_vdecsys_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8173-imgsys",
 		.of_match_table = of_match_clk_mt8173_imgsys,
diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index ecc8b0063ea5..fa2d1d557e04 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -156,7 +156,7 @@ static struct platform_driver clk_mt8173_infracfg_drv = {
 		.of_match_table = of_match_clk_mt8173_infracfg,
 	},
 	.probe = clk_mt8173_infracfg_probe,
-	.remove_new = clk_mt8173_infracfg_remove,
+	.remove = clk_mt8173_infracfg_remove,
 };
 module_platform_driver(clk_mt8173_infracfg_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt8173-mm.c b/drivers/clk/mediatek/clk-mt8173-mm.c
index fd903bee328f..26d27250b914 100644
--- a/drivers/clk/mediatek/clk-mt8173-mm.c
+++ b/drivers/clk/mediatek/clk-mt8173-mm.c
@@ -106,7 +106,7 @@ static struct platform_driver clk_mt8173_mm_drv = {
 	},
 	.id_table = clk_mt8173_mm_id_table,
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 };
 module_platform_driver(clk_mt8173_mm_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt8173-pericfg.c b/drivers/clk/mediatek/clk-mt8173-pericfg.c
index 783efed3f254..bebda74d0f43 100644
--- a/drivers/clk/mediatek/clk-mt8173-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-pericfg.c
@@ -115,7 +115,7 @@ static struct platform_driver clk_mt8173_pericfg_drv = {
 		.of_match_table = of_match_clk_mt8173_pericfg,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt8173_pericfg_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt8173-topckgen.c b/drivers/clk/mediatek/clk-mt8173-topckgen.c
index 6bb7ffd74487..42c37541cebb 100644
--- a/drivers/clk/mediatek/clk-mt8173-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8173-topckgen.c
@@ -646,7 +646,7 @@ static struct platform_driver clk_mt8173_topckgen_drv = {
 		.of_match_table = of_match_clk_mt8173_topckgen,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt8173_topckgen_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt8173-vdecsys.c b/drivers/clk/mediatek/clk-mt8173-vdecsys.c
index 011e3812156f..625ca0b09cc2 100644
--- a/drivers/clk/mediatek/clk-mt8173-vdecsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-vdecsys.c
@@ -46,7 +46,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_vdecsys);
 
 static struct platform_driver clk_mt8173_vdecsys_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8173-vdecsys",
 		.of_match_table = of_match_clk_mt8173_vdecsys,
diff --git a/drivers/clk/mediatek/clk-mt8173-vencsys.c b/drivers/clk/mediatek/clk-mt8173-vencsys.c
index 1bf84ae6a0bc..87755dd1a337 100644
--- a/drivers/clk/mediatek/clk-mt8173-vencsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-vencsys.c
@@ -57,7 +57,7 @@ static struct platform_driver clk_mt8173_vencsys_drv = {
 		.of_match_table = of_match_clk_mt8173_vencsys,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt8173_vencsys_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt8183-audio.c b/drivers/clk/mediatek/clk-mt8183-audio.c
index 30a20e8ba84b..011d329ad30e 100644
--- a/drivers/clk/mediatek/clk-mt8183-audio.c
+++ b/drivers/clk/mediatek/clk-mt8183-audio.c
@@ -101,7 +101,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_audio);
 
 static struct platform_driver clk_mt8183_audio_drv = {
 	.probe = clk_mt8183_audio_probe,
-	.remove_new = clk_mt8183_audio_remove,
+	.remove = clk_mt8183_audio_remove,
 	.driver = {
 		.name = "clk-mt8183-audio",
 		.of_match_table = of_match_clk_mt8183_audio,
diff --git a/drivers/clk/mediatek/clk-mt8183-cam.c b/drivers/clk/mediatek/clk-mt8183-cam.c
index f16c3aa3c911..c7642085f8de 100644
--- a/drivers/clk/mediatek/clk-mt8183-cam.c
+++ b/drivers/clk/mediatek/clk-mt8183-cam.c
@@ -51,7 +51,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_cam);
 
 static struct platform_driver clk_mt8183_cam_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-cam",
 		.of_match_table = of_match_clk_mt8183_cam,
diff --git a/drivers/clk/mediatek/clk-mt8183-img.c b/drivers/clk/mediatek/clk-mt8183-img.c
index 32ee6a1867fc..ee92459c74ca 100644
--- a/drivers/clk/mediatek/clk-mt8183-img.c
+++ b/drivers/clk/mediatek/clk-mt8183-img.c
@@ -51,7 +51,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_img);
 
 static struct platform_driver clk_mt8183_img_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-img",
 		.of_match_table = of_match_clk_mt8183_img,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu0.c b/drivers/clk/mediatek/clk-mt8183-ipu0.c
index dc2916c4e0dc..6831747f123b 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu0.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu0.c
@@ -44,7 +44,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_ipu_core0);
 
 static struct platform_driver clk_mt8183_ipu_core0_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-ipu_core0",
 		.of_match_table = of_match_clk_mt8183_ipu_core0,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu1.c b/drivers/clk/mediatek/clk-mt8183-ipu1.c
index 9c63e4c592d0..ecf434432e7b 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu1.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu1.c
@@ -44,7 +44,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_ipu_core1);
 
 static struct platform_driver clk_mt8183_ipu_core1_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-ipu_core1",
 		.of_match_table = of_match_clk_mt8183_ipu_core1,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu_adl.c b/drivers/clk/mediatek/clk-mt8183-ipu_adl.c
index 54a50eda1719..c1a770ba3245 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu_adl.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu_adl.c
@@ -42,7 +42,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_ipu_adl);
 
 static struct platform_driver clk_mt8183_ipu_adl_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-ipu_adl",
 		.of_match_table = of_match_clk_mt8183_ipu_adl,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu_conn.c b/drivers/clk/mediatek/clk-mt8183-ipu_conn.c
index 99a817d3be6c..f0e72e6edb7a 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu_conn.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu_conn.c
@@ -111,7 +111,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_ipu_conn);
 
 static struct platform_driver clk_mt8183_ipu_conn_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-ipu_conn",
 		.of_match_table = of_match_clk_mt8183_ipu_conn,
diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index b1e802bbfaef..be44889783ff 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -44,7 +44,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_mfg);
 
 static struct platform_driver clk_mt8183_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-mfg",
 		.of_match_table = of_match_clk_mt8183_mfg,
diff --git a/drivers/clk/mediatek/clk-mt8183-mm.c b/drivers/clk/mediatek/clk-mt8183-mm.c
index 59acf1e2951b..0f132f05fa8b 100644
--- a/drivers/clk/mediatek/clk-mt8183-mm.c
+++ b/drivers/clk/mediatek/clk-mt8183-mm.c
@@ -95,7 +95,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt8183_mm_id_table);
 
 static struct platform_driver clk_mt8183_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt8183-mm",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8183-vdec.c b/drivers/clk/mediatek/clk-mt8183-vdec.c
index 48a8ef3f69aa..43bf34077b16 100644
--- a/drivers/clk/mediatek/clk-mt8183-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8183-vdec.c
@@ -55,7 +55,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_vdec);
 
 static struct platform_driver clk_mt8183_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-vdec",
 		.of_match_table = of_match_clk_mt8183_vdec,
diff --git a/drivers/clk/mediatek/clk-mt8183-venc.c b/drivers/clk/mediatek/clk-mt8183-venc.c
index 8f36688dfa14..c3d99b3b8ff7 100644
--- a/drivers/clk/mediatek/clk-mt8183-venc.c
+++ b/drivers/clk/mediatek/clk-mt8183-venc.c
@@ -47,7 +47,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_venc);
 
 static struct platform_driver clk_mt8183_venc_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-venc",
 		.of_match_table = of_match_clk_mt8183_venc,
diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 27eee4ef2c0f..aa7cc7709b2d 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -899,7 +899,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8183);
 
 static struct platform_driver clk_mt8183_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183",
 		.of_match_table = of_match_clk_mt8183,
diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
index 6f7127003e4f..4b2b16578232 100644
--- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
@@ -185,7 +185,7 @@ static void clk_mt8186_apmixed_remove(struct platform_device *pdev)
 
 static struct platform_driver clk_mt8186_apmixed_drv = {
 	.probe = clk_mt8186_apmixed_probe,
-	.remove_new = clk_mt8186_apmixed_remove,
+	.remove = clk_mt8186_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8186-apmixed",
 		.of_match_table = of_match_clk_mt8186_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt8186-cam.c b/drivers/clk/mediatek/clk-mt8186-cam.c
index 0082f0d9286b..2ddd5f90377f 100644
--- a/drivers/clk/mediatek/clk-mt8186-cam.c
+++ b/drivers/clk/mediatek/clk-mt8186-cam.c
@@ -82,7 +82,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_cam);
 
 static struct platform_driver clk_mt8186_cam_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-cam",
 		.of_match_table = of_match_clk_mt8186_cam,
diff --git a/drivers/clk/mediatek/clk-mt8186-img.c b/drivers/clk/mediatek/clk-mt8186-img.c
index 0583a18805ce..5e466e1f5f44 100644
--- a/drivers/clk/mediatek/clk-mt8186-img.c
+++ b/drivers/clk/mediatek/clk-mt8186-img.c
@@ -60,7 +60,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_img);
 
 static struct platform_driver clk_mt8186_img_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-img",
 		.of_match_table = of_match_clk_mt8186_img,
diff --git a/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
index 2a2a6bb23205..75abb871044c 100644
--- a/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
+++ b/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
@@ -59,7 +59,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_imp_iic_wrap);
 
 static struct platform_driver clk_mt8186_imp_iic_wrap_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-imp_iic_wrap",
 		.of_match_table = of_match_clk_mt8186_imp_iic_wrap,
diff --git a/drivers/clk/mediatek/clk-mt8186-infra_ao.c b/drivers/clk/mediatek/clk-mt8186-infra_ao.c
index d7239875fb15..8d9d86a510ff 100644
--- a/drivers/clk/mediatek/clk-mt8186-infra_ao.c
+++ b/drivers/clk/mediatek/clk-mt8186-infra_ao.c
@@ -231,7 +231,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_infra_ao);
 
 static struct platform_driver clk_mt8186_infra_ao_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-infra-ao",
 		.of_match_table = of_match_clk_mt8186_infra_ao,
diff --git a/drivers/clk/mediatek/clk-mt8186-ipe.c b/drivers/clk/mediatek/clk-mt8186-ipe.c
index 77bdd2806517..f66a0aeaa6b3 100644
--- a/drivers/clk/mediatek/clk-mt8186-ipe.c
+++ b/drivers/clk/mediatek/clk-mt8186-ipe.c
@@ -47,7 +47,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_ipe);
 
 static struct platform_driver clk_mt8186_ipe_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-ipe",
 		.of_match_table = of_match_clk_mt8186_ipe,
diff --git a/drivers/clk/mediatek/clk-mt8186-mcu.c b/drivers/clk/mediatek/clk-mt8186-mcu.c
index eb54ccb77b74..d1640e4dc2ad 100644
--- a/drivers/clk/mediatek/clk-mt8186-mcu.c
+++ b/drivers/clk/mediatek/clk-mt8186-mcu.c
@@ -60,7 +60,7 @@ static struct platform_driver clk_mt8186_mcu_drv = {
 		.of_match_table = of_match_clk_mt8186_mcu,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt8186_mcu_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt8186-mdp.c b/drivers/clk/mediatek/clk-mt8186-mdp.c
index fb47d6bacf7f..01561cf902c4 100644
--- a/drivers/clk/mediatek/clk-mt8186-mdp.c
+++ b/drivers/clk/mediatek/clk-mt8186-mdp.c
@@ -72,7 +72,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_mdp);
 
 static struct platform_driver clk_mt8186_mdp_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-mdp",
 		.of_match_table = of_match_clk_mt8186_mdp,
diff --git a/drivers/clk/mediatek/clk-mt8186-mfg.c b/drivers/clk/mediatek/clk-mt8186-mfg.c
index 64cdee1fddd4..3f21b1f222e1 100644
--- a/drivers/clk/mediatek/clk-mt8186-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8186-mfg.c
@@ -41,7 +41,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_mfg);
 
 static struct platform_driver clk_mt8186_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-mfg",
 		.of_match_table = of_match_clk_mt8186_mfg,
diff --git a/drivers/clk/mediatek/clk-mt8186-mm.c b/drivers/clk/mediatek/clk-mt8186-mm.c
index 403566187e64..fc8488c44866 100644
--- a/drivers/clk/mediatek/clk-mt8186-mm.c
+++ b/drivers/clk/mediatek/clk-mt8186-mm.c
@@ -71,7 +71,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt8186_mm_id_table);
 
 static struct platform_driver clk_mt8186_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt8186-mm",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8186-topckgen.c b/drivers/clk/mediatek/clk-mt8186-topckgen.c
index eb9f51e77ca8..14f1cbdbbd13 100644
--- a/drivers/clk/mediatek/clk-mt8186-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8186-topckgen.c
@@ -725,7 +725,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_topck);
 
 static struct platform_driver clk_mt8186_topck_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-topck",
 		.of_match_table = of_match_clk_mt8186_topck,
diff --git a/drivers/clk/mediatek/clk-mt8186-vdec.c b/drivers/clk/mediatek/clk-mt8186-vdec.c
index 25465704ddfb..522b8c952969 100644
--- a/drivers/clk/mediatek/clk-mt8186-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8186-vdec.c
@@ -80,7 +80,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_vdec);
 
 static struct platform_driver clk_mt8186_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-vdec",
 		.of_match_table = of_match_clk_mt8186_vdec,
diff --git a/drivers/clk/mediatek/clk-mt8186-venc.c b/drivers/clk/mediatek/clk-mt8186-venc.c
index 647dd66a3ce0..c0c98bc75112 100644
--- a/drivers/clk/mediatek/clk-mt8186-venc.c
+++ b/drivers/clk/mediatek/clk-mt8186-venc.c
@@ -43,7 +43,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_venc);
 
 static struct platform_driver clk_mt8186_venc_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-venc",
 		.of_match_table = of_match_clk_mt8186_venc,
diff --git a/drivers/clk/mediatek/clk-mt8186-wpe.c b/drivers/clk/mediatek/clk-mt8186-wpe.c
index 47f96e088361..babd7b2778c2 100644
--- a/drivers/clk/mediatek/clk-mt8186-wpe.c
+++ b/drivers/clk/mediatek/clk-mt8186-wpe.c
@@ -43,7 +43,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8186_wpe);
 
 static struct platform_driver clk_mt8186_wpe_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8186-wpe",
 		.of_match_table = of_match_clk_mt8186_wpe,
diff --git a/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
index 5ac035bbe684..dcde2187d24a 100644
--- a/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
+++ b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
@@ -40,7 +40,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_adsp_audio26m);
 
 static struct platform_driver clk_mt8188_adsp_audio26m_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-adsp_audio26m",
 		.of_match_table = of_match_clk_mt8188_adsp_audio26m,
diff --git a/drivers/clk/mediatek/clk-mt8188-apmixedsys.c b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
index 85d573d96081..21d7a9a2ab1a 100644
--- a/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
@@ -145,7 +145,7 @@ static void clk_mt8188_apmixed_remove(struct platform_device *pdev)
 
 static struct platform_driver clk_mt8188_apmixed_drv = {
 	.probe = clk_mt8188_apmixed_probe,
-	.remove_new = clk_mt8188_apmixed_remove,
+	.remove = clk_mt8188_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8188-apmixed",
 		.of_match_table = of_match_clk_mt8188_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt8188-cam.c b/drivers/clk/mediatek/clk-mt8188-cam.c
index a6a6581f0461..7500bd25387f 100644
--- a/drivers/clk/mediatek/clk-mt8188-cam.c
+++ b/drivers/clk/mediatek/clk-mt8188-cam.c
@@ -109,7 +109,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_cam);
 
 static struct platform_driver clk_mt8188_cam_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-cam",
 		.of_match_table = of_match_clk_mt8188_cam,
diff --git a/drivers/clk/mediatek/clk-mt8188-ccu.c b/drivers/clk/mediatek/clk-mt8188-ccu.c
index 9532fc652f01..1566fc437ea3 100644
--- a/drivers/clk/mediatek/clk-mt8188-ccu.c
+++ b/drivers/clk/mediatek/clk-mt8188-ccu.c
@@ -39,7 +39,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_ccu);
 
 static struct platform_driver clk_mt8188_ccu_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-ccu",
 		.of_match_table = of_match_clk_mt8188_ccu,
diff --git a/drivers/clk/mediatek/clk-mt8188-img.c b/drivers/clk/mediatek/clk-mt8188-img.c
index 00ad6d7884ae..cb2fbd4136b9 100644
--- a/drivers/clk/mediatek/clk-mt8188-img.c
+++ b/drivers/clk/mediatek/clk-mt8188-img.c
@@ -101,7 +101,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_imgsys_main);
 
 static struct platform_driver clk_mt8188_imgsys_main_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-imgsys_main",
 		.of_match_table = of_match_clk_mt8188_imgsys_main,
diff --git a/drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c
index 7b713f4cd662..14a4b575b583 100644
--- a/drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c
+++ b/drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c
@@ -71,7 +71,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_imp_iic_wrap);
 
 static struct platform_driver clk_mt8188_imp_iic_wrap_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-imp_iic_wrap",
 		.of_match_table = of_match_clk_mt8188_imp_iic_wrap,
diff --git a/drivers/clk/mediatek/clk-mt8188-infra_ao.c b/drivers/clk/mediatek/clk-mt8188-infra_ao.c
index face3e191464..b9bc8fcc2ade 100644
--- a/drivers/clk/mediatek/clk-mt8188-infra_ao.c
+++ b/drivers/clk/mediatek/clk-mt8188-infra_ao.c
@@ -213,7 +213,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_infra_ao);
 
 static struct platform_driver clk_mt8188_infra_ao_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-infra_ao",
 		.of_match_table = of_match_clk_mt8188_infra_ao,
diff --git a/drivers/clk/mediatek/clk-mt8188-ipe.c b/drivers/clk/mediatek/clk-mt8188-ipe.c
index fa439af34359..8f1933b71e28 100644
--- a/drivers/clk/mediatek/clk-mt8188-ipe.c
+++ b/drivers/clk/mediatek/clk-mt8188-ipe.c
@@ -41,7 +41,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_ipe);
 
 static struct platform_driver clk_mt8188_ipe_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-ipe",
 		.of_match_table = of_match_clk_mt8188_ipe,
diff --git a/drivers/clk/mediatek/clk-mt8188-mfg.c b/drivers/clk/mediatek/clk-mt8188-mfg.c
index ec562e7d459d..2ddfb1a3de47 100644
--- a/drivers/clk/mediatek/clk-mt8188-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8188-mfg.c
@@ -38,7 +38,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_mfgcfg);
 
 static struct platform_driver clk_mt8188_mfgcfg_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-mfgcfg",
 		.of_match_table = of_match_clk_mt8188_mfgcfg,
diff --git a/drivers/clk/mediatek/clk-mt8188-peri_ao.c b/drivers/clk/mediatek/clk-mt8188-peri_ao.c
index e4339885b062..639865335fc8 100644
--- a/drivers/clk/mediatek/clk-mt8188-peri_ao.c
+++ b/drivers/clk/mediatek/clk-mt8188-peri_ao.c
@@ -49,7 +49,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_peri_ao);
 
 static struct platform_driver clk_mt8188_peri_ao_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-peri_ao",
 		.of_match_table = of_match_clk_mt8188_peri_ao,
diff --git a/drivers/clk/mediatek/clk-mt8188-topckgen.c b/drivers/clk/mediatek/clk-mt8188-topckgen.c
index 2ccc8a1c98f9..c4baf4076ed6 100644
--- a/drivers/clk/mediatek/clk-mt8188-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8188-topckgen.c
@@ -1347,7 +1347,7 @@ static void clk_mt8188_topck_remove(struct platform_device *pdev)
 
 static struct platform_driver clk_mt8188_topck_drv = {
 	.probe = clk_mt8188_topck_probe,
-	.remove_new = clk_mt8188_topck_remove,
+	.remove = clk_mt8188_topck_remove,
 	.driver = {
 		.name = "clk-mt8188-topck",
 		.of_match_table = of_match_clk_mt8188_topck,
diff --git a/drivers/clk/mediatek/clk-mt8188-vdec.c b/drivers/clk/mediatek/clk-mt8188-vdec.c
index bf388997c3f8..f48f0716d7c2 100644
--- a/drivers/clk/mediatek/clk-mt8188-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8188-vdec.c
@@ -81,7 +81,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_vdec);
 
 static struct platform_driver clk_mt8188_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-vdec",
 		.of_match_table = of_match_clk_mt8188_vdec,
diff --git a/drivers/clk/mediatek/clk-mt8188-vdo0.c b/drivers/clk/mediatek/clk-mt8188-vdo0.c
index 935371fbf1d2..017d6662589b 100644
--- a/drivers/clk/mediatek/clk-mt8188-vdo0.c
+++ b/drivers/clk/mediatek/clk-mt8188-vdo0.c
@@ -97,7 +97,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt8188_vdo0_id_table);
 
 static struct platform_driver clk_mt8188_vdo0_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt8188-vdo0",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8188-vdo1.c b/drivers/clk/mediatek/clk-mt8188-vdo1.c
index fb24c9026fd8..4fa355f8f0c2 100644
--- a/drivers/clk/mediatek/clk-mt8188-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8188-vdo1.c
@@ -144,7 +144,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt8188_vdo1_id_table);
 
 static struct platform_driver clk_mt8188_vdo1_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt8188-vdo1",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8188-venc.c b/drivers/clk/mediatek/clk-mt8188-venc.c
index 4df8d4e05159..01e971545506 100644
--- a/drivers/clk/mediatek/clk-mt8188-venc.c
+++ b/drivers/clk/mediatek/clk-mt8188-venc.c
@@ -45,7 +45,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_venc1);
 
 static struct platform_driver clk_mt8188_venc1_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-venc1",
 		.of_match_table = of_match_clk_mt8188_venc1,
diff --git a/drivers/clk/mediatek/clk-mt8188-vpp0.c b/drivers/clk/mediatek/clk-mt8188-vpp0.c
index 310792108793..cd2579b7b9c3 100644
--- a/drivers/clk/mediatek/clk-mt8188-vpp0.c
+++ b/drivers/clk/mediatek/clk-mt8188-vpp0.c
@@ -104,7 +104,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt8188_vpp0_id_table);
 
 static struct platform_driver clk_mt8188_vpp0_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt8188-vpp0",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8188-vpp1.c b/drivers/clk/mediatek/clk-mt8188-vpp1.c
index 0aa10aaa0292..0e1bd8306e8a 100644
--- a/drivers/clk/mediatek/clk-mt8188-vpp1.c
+++ b/drivers/clk/mediatek/clk-mt8188-vpp1.c
@@ -99,7 +99,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt8188_vpp1_id_table);
 
 static struct platform_driver clk_mt8188_vpp1_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt8188-vpp1",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8188-wpe.c b/drivers/clk/mediatek/clk-mt8188-wpe.c
index fbac440363cc..d709bb1ee1d6 100644
--- a/drivers/clk/mediatek/clk-mt8188-wpe.c
+++ b/drivers/clk/mediatek/clk-mt8188-wpe.c
@@ -94,7 +94,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8188_wpe);
 
 static struct platform_driver clk_mt8188_wpe_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8188-wpe",
 		.of_match_table = of_match_clk_mt8188_wpe,
diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index 3590932acc63..0b66a27e4d5a 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -206,7 +206,7 @@ static struct platform_driver clk_mt8192_apmixed_drv = {
 		.of_match_table = of_match_clk_mt8192_apmixed,
 	},
 	.probe = clk_mt8192_apmixed_probe,
-	.remove_new = clk_mt8192_apmixed_remove,
+	.remove = clk_mt8192_apmixed_remove,
 };
 module_platform_driver(clk_mt8192_apmixed_drv);
 MODULE_DESCRIPTION("MediaTek MT8192 apmixed clocks driver");
diff --git a/drivers/clk/mediatek/clk-mt8192-aud.c b/drivers/clk/mediatek/clk-mt8192-aud.c
index b438ebad998d..f3ebf8713fbb 100644
--- a/drivers/clk/mediatek/clk-mt8192-aud.c
+++ b/drivers/clk/mediatek/clk-mt8192-aud.c
@@ -111,7 +111,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_aud);
 
 static struct platform_driver clk_mt8192_aud_drv = {
 	.probe = clk_mt8192_aud_probe,
-	.remove_new = clk_mt8192_aud_remove,
+	.remove = clk_mt8192_aud_remove,
 	.driver = {
 		.name = "clk-mt8192-aud",
 		.of_match_table = of_match_clk_mt8192_aud,
diff --git a/drivers/clk/mediatek/clk-mt8192-cam.c b/drivers/clk/mediatek/clk-mt8192-cam.c
index 3eed4a7b6d8e..891d2f88d9cf 100644
--- a/drivers/clk/mediatek/clk-mt8192-cam.c
+++ b/drivers/clk/mediatek/clk-mt8192-cam.c
@@ -99,7 +99,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_cam);
 
 static struct platform_driver clk_mt8192_cam_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-cam",
 		.of_match_table = of_match_clk_mt8192_cam,
diff --git a/drivers/clk/mediatek/clk-mt8192-img.c b/drivers/clk/mediatek/clk-mt8192-img.c
index 13a435332752..c08e831125a5 100644
--- a/drivers/clk/mediatek/clk-mt8192-img.c
+++ b/drivers/clk/mediatek/clk-mt8192-img.c
@@ -62,7 +62,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_img);
 
 static struct platform_driver clk_mt8192_img_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-img",
 		.of_match_table = of_match_clk_mt8192_img,
diff --git a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
index 45585f2edd50..0f9530d9263c 100644
--- a/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
+++ b/drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.c
@@ -111,7 +111,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_imp_iic_wrap);
 
 static struct platform_driver clk_mt8192_imp_iic_wrap_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-imp_iic_wrap",
 		.of_match_table = of_match_clk_mt8192_imp_iic_wrap,
diff --git a/drivers/clk/mediatek/clk-mt8192-ipe.c b/drivers/clk/mediatek/clk-mt8192-ipe.c
index da2e2d83cd25..c932b8b20edc 100644
--- a/drivers/clk/mediatek/clk-mt8192-ipe.c
+++ b/drivers/clk/mediatek/clk-mt8192-ipe.c
@@ -49,7 +49,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_ipe);
 
 static struct platform_driver clk_mt8192_ipe_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-ipe",
 		.of_match_table = of_match_clk_mt8192_ipe,
diff --git a/drivers/clk/mediatek/clk-mt8192-mdp.c b/drivers/clk/mediatek/clk-mt8192-mdp.c
index be674d6c31d7..30334ebca864 100644
--- a/drivers/clk/mediatek/clk-mt8192-mdp.c
+++ b/drivers/clk/mediatek/clk-mt8192-mdp.c
@@ -74,7 +74,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_mdp);
 
 static struct platform_driver clk_mt8192_mdp_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-mdp",
 		.of_match_table = of_match_clk_mt8192_mdp,
diff --git a/drivers/clk/mediatek/clk-mt8192-mfg.c b/drivers/clk/mediatek/clk-mt8192-mfg.c
index 2da969f4ca6b..9d176659e8a2 100644
--- a/drivers/clk/mediatek/clk-mt8192-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8192-mfg.c
@@ -44,7 +44,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_mfg);
 
 static struct platform_driver clk_mt8192_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-mfg",
 		.of_match_table = of_match_clk_mt8192_mfg,
diff --git a/drivers/clk/mediatek/clk-mt8192-mm.c b/drivers/clk/mediatek/clk-mt8192-mm.c
index 2b9c1c4524c2..bda4406e1304 100644
--- a/drivers/clk/mediatek/clk-mt8192-mm.c
+++ b/drivers/clk/mediatek/clk-mt8192-mm.c
@@ -93,7 +93,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt8192_mm_id_table);
 
 static struct platform_driver clk_mt8192_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt8192-mm",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8192-msdc.c b/drivers/clk/mediatek/clk-mt8192-msdc.c
index bc5ce987b76c..04a66220f269 100644
--- a/drivers/clk/mediatek/clk-mt8192-msdc.c
+++ b/drivers/clk/mediatek/clk-mt8192-msdc.c
@@ -56,7 +56,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_msdc);
 
 static struct platform_driver clk_mt8192_msdc_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-msdc",
 		.of_match_table = of_match_clk_mt8192_msdc,
diff --git a/drivers/clk/mediatek/clk-mt8192-scp_adsp.c b/drivers/clk/mediatek/clk-mt8192-scp_adsp.c
index e017d30a8832..f9e4c16573e2 100644
--- a/drivers/clk/mediatek/clk-mt8192-scp_adsp.c
+++ b/drivers/clk/mediatek/clk-mt8192-scp_adsp.c
@@ -42,7 +42,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_scp_adsp);
 
 static struct platform_driver clk_mt8192_scp_adsp_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-scp_adsp",
 		.of_match_table = of_match_clk_mt8192_scp_adsp,
diff --git a/drivers/clk/mediatek/clk-mt8192-vdec.c b/drivers/clk/mediatek/clk-mt8192-vdec.c
index fcb34b1dcdab..9c10161807b2 100644
--- a/drivers/clk/mediatek/clk-mt8192-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8192-vdec.c
@@ -86,7 +86,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_vdec);
 
 static struct platform_driver clk_mt8192_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-vdec",
 		.of_match_table = of_match_clk_mt8192_vdec,
diff --git a/drivers/clk/mediatek/clk-mt8192-venc.c b/drivers/clk/mediatek/clk-mt8192-venc.c
index 98d58a9397cd..0b01e2b7f036 100644
--- a/drivers/clk/mediatek/clk-mt8192-venc.c
+++ b/drivers/clk/mediatek/clk-mt8192-venc.c
@@ -45,7 +45,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8192_venc);
 
 static struct platform_driver clk_mt8192_venc_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8192-venc",
 		.of_match_table = of_match_clk_mt8192_venc,
diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index bce2298ebc8d..50b43807c60c 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1026,7 +1026,7 @@ static struct platform_driver clk_mt8192_drv = {
 		.of_match_table = of_match_clk_mt8192,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt8192_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index 049ae8123e34..282a3137dc89 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -223,7 +223,7 @@ static void clk_mt8195_apmixed_remove(struct platform_device *pdev)
 
 static struct platform_driver clk_mt8195_apmixed_drv = {
 	.probe = clk_mt8195_apmixed_probe,
-	.remove_new = clk_mt8195_apmixed_remove,
+	.remove = clk_mt8195_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8195-apmixed",
 		.of_match_table = of_match_clk_mt8195_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
index b1b562e44cb4..8b45a3fad02f 100644
--- a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
+++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
@@ -103,7 +103,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_apusys_pll);
 
 static struct platform_driver clk_mt8195_apusys_pll_drv = {
 	.probe = clk_mt8195_apusys_pll_probe,
-	.remove_new = clk_mt8195_apusys_pll_remove,
+	.remove = clk_mt8195_apusys_pll_remove,
 	.driver = {
 		.name = "clk-mt8195-apusys_pll",
 		.of_match_table = of_match_clk_mt8195_apusys_pll,
diff --git a/drivers/clk/mediatek/clk-mt8195-cam.c b/drivers/clk/mediatek/clk-mt8195-cam.c
index 7c8f77817616..02cb20c2948b 100644
--- a/drivers/clk/mediatek/clk-mt8195-cam.c
+++ b/drivers/clk/mediatek/clk-mt8195-cam.c
@@ -135,7 +135,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_cam);
 
 static struct platform_driver clk_mt8195_cam_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-cam",
 		.of_match_table = of_match_clk_mt8195_cam,
diff --git a/drivers/clk/mediatek/clk-mt8195-ccu.c b/drivers/clk/mediatek/clk-mt8195-ccu.c
index f78afd7b6ade..22cd1cb070f1 100644
--- a/drivers/clk/mediatek/clk-mt8195-ccu.c
+++ b/drivers/clk/mediatek/clk-mt8195-ccu.c
@@ -43,7 +43,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_ccu);
 
 static struct platform_driver clk_mt8195_ccu_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-ccu",
 		.of_match_table = of_match_clk_mt8195_ccu,
diff --git a/drivers/clk/mediatek/clk-mt8195-img.c b/drivers/clk/mediatek/clk-mt8195-img.c
index a59c082ef522..11beba4b2ac2 100644
--- a/drivers/clk/mediatek/clk-mt8195-img.c
+++ b/drivers/clk/mediatek/clk-mt8195-img.c
@@ -89,7 +89,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_img);
 
 static struct platform_driver clk_mt8195_img_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-img",
 		.of_match_table = of_match_clk_mt8195_img,
diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
index 54557f1b0681..8711b18b1576 100644
--- a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
+++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
@@ -59,7 +59,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_imp_iic_wrap);
 
 static struct platform_driver clk_mt8195_imp_iic_wrap_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-imp_iic_wrap",
 		.of_match_table = of_match_clk_mt8195_imp_iic_wrap,
diff --git a/drivers/clk/mediatek/clk-mt8195-infra_ao.c b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
index 165fe92c6f61..bb648a88e43a 100644
--- a/drivers/clk/mediatek/clk-mt8195-infra_ao.c
+++ b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
@@ -233,7 +233,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_infra_ao);
 
 static struct platform_driver clk_mt8195_infra_ao_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-infra_ao",
 		.of_match_table = of_match_clk_mt8195_infra_ao,
diff --git a/drivers/clk/mediatek/clk-mt8195-ipe.c b/drivers/clk/mediatek/clk-mt8195-ipe.c
index 38a23d88370b..b1af00348a86 100644
--- a/drivers/clk/mediatek/clk-mt8195-ipe.c
+++ b/drivers/clk/mediatek/clk-mt8195-ipe.c
@@ -44,7 +44,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_ipe);
 
 static struct platform_driver clk_mt8195_ipe_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-ipe",
 		.of_match_table = of_match_clk_mt8195_ipe,
diff --git a/drivers/clk/mediatek/clk-mt8195-mfg.c b/drivers/clk/mediatek/clk-mt8195-mfg.c
index e19968eeb346..07c358db1af9 100644
--- a/drivers/clk/mediatek/clk-mt8195-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8195-mfg.c
@@ -42,7 +42,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_mfg);
 
 static struct platform_driver clk_mt8195_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-mfg",
 		.of_match_table = of_match_clk_mt8195_mfg,
diff --git a/drivers/clk/mediatek/clk-mt8195-peri_ao.c b/drivers/clk/mediatek/clk-mt8195-peri_ao.c
index fc341030f10b..b743eb60a30b 100644
--- a/drivers/clk/mediatek/clk-mt8195-peri_ao.c
+++ b/drivers/clk/mediatek/clk-mt8195-peri_ao.c
@@ -55,7 +55,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_peri_ao);
 
 static struct platform_driver clk_mt8195_peri_ao_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-peri_ao",
 		.of_match_table = of_match_clk_mt8195_peri_ao,
diff --git a/drivers/clk/mediatek/clk-mt8195-scp_adsp.c b/drivers/clk/mediatek/clk-mt8195-scp_adsp.c
index 1f37bde97d90..bc73fccd0515 100644
--- a/drivers/clk/mediatek/clk-mt8195-scp_adsp.c
+++ b/drivers/clk/mediatek/clk-mt8195-scp_adsp.c
@@ -40,7 +40,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_scp_adsp);
 
 static struct platform_driver clk_mt8195_scp_adsp_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-scp_adsp",
 		.of_match_table = of_match_clk_mt8195_scp_adsp,
diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index 704498c40349..b1f44b873354 100644
--- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
@@ -1354,7 +1354,7 @@ static void clk_mt8195_topck_remove(struct platform_device *pdev)
 
 static struct platform_driver clk_mt8195_topck_drv = {
 	.probe = clk_mt8195_topck_probe,
-	.remove_new = clk_mt8195_topck_remove,
+	.remove = clk_mt8195_topck_remove,
 	.driver = {
 		.name = "clk-mt8195-topck",
 		.of_match_table = of_match_clk_mt8195_topck,
diff --git a/drivers/clk/mediatek/clk-mt8195-vdec.c b/drivers/clk/mediatek/clk-mt8195-vdec.c
index 9e4cc1a82cbe..0bad706047c9 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdec.c
@@ -97,7 +97,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_vdec);
 
 static struct platform_driver clk_mt8195_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-vdec",
 		.of_match_table = of_match_clk_mt8195_vdec,
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
index 6e9c3ef19502..581d99f8c254 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo0.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
@@ -106,7 +106,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt8195_vdo0_id_table);
 
 static struct platform_driver clk_mt8195_vdo0_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt8195-vdo0",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
index 422e5729386c..7f8b1a8967bd 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
@@ -133,7 +133,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt8195_vdo1_id_table);
 
 static struct platform_driver clk_mt8195_vdo1_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt8195-vdo1",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8195-venc.c b/drivers/clk/mediatek/clk-mt8195-venc.c
index db7a6ce97ed0..3b52ff025d5e 100644
--- a/drivers/clk/mediatek/clk-mt8195-venc.c
+++ b/drivers/clk/mediatek/clk-mt8195-venc.c
@@ -62,7 +62,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_venc);
 
 static struct platform_driver clk_mt8195_venc_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-venc",
 		.of_match_table = of_match_clk_mt8195_venc,
diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
index 77d9aaf47a25..0e3e1dd7977c 100644
--- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
+++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
@@ -99,7 +99,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt8195_vpp0_id_table);
 
 static struct platform_driver clk_mt8195_vpp0_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt8195-vpp0",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c b/drivers/clk/mediatek/clk-mt8195-vpp1.c
index 18ca8f1d9538..fb7b7aef0bba 100644
--- a/drivers/clk/mediatek/clk-mt8195-vpp1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
@@ -97,7 +97,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt8195_vpp1_id_table);
 
 static struct platform_driver clk_mt8195_vpp1_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt8195-vpp1",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8195-wpe.c b/drivers/clk/mediatek/clk-mt8195-wpe.c
index 9c45a2fed0ce..315b93bbfcdc 100644
--- a/drivers/clk/mediatek/clk-mt8195-wpe.c
+++ b/drivers/clk/mediatek/clk-mt8195-wpe.c
@@ -136,7 +136,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_wpe);
 
 static struct platform_driver clk_mt8195_wpe_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-wpe",
 		.of_match_table = of_match_clk_mt8195_wpe,
diff --git a/drivers/clk/mediatek/clk-mt8365-apu.c b/drivers/clk/mediatek/clk-mt8365-apu.c
index 934060e6d9e9..2583c4704ffa 100644
--- a/drivers/clk/mediatek/clk-mt8365-apu.c
+++ b/drivers/clk/mediatek/clk-mt8365-apu.c
@@ -46,7 +46,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8365_apu);
 
 static struct platform_driver clk_mt8365_apu_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8365-apu",
 		.of_match_table = of_match_clk_mt8365_apu,
diff --git a/drivers/clk/mediatek/clk-mt8365-cam.c b/drivers/clk/mediatek/clk-mt8365-cam.c
index c8fe5f5bb06c..89d2bd50263b 100644
--- a/drivers/clk/mediatek/clk-mt8365-cam.c
+++ b/drivers/clk/mediatek/clk-mt8365-cam.c
@@ -48,7 +48,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8365_cam);
 
 static struct platform_driver clk_mt8365_cam_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8365-cam",
 		.of_match_table = of_match_clk_mt8365_cam,
diff --git a/drivers/clk/mediatek/clk-mt8365-mfg.c b/drivers/clk/mediatek/clk-mt8365-mfg.c
index 5355f725363d..41bcd389119c 100644
--- a/drivers/clk/mediatek/clk-mt8365-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8365-mfg.c
@@ -54,7 +54,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8365_mfg);
 
 static struct platform_driver clk_mt8365_mfg_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8365-mfg",
 		.of_match_table = of_match_clk_mt8365_mfg,
diff --git a/drivers/clk/mediatek/clk-mt8365-mm.c b/drivers/clk/mediatek/clk-mt8365-mm.c
index 8201949bfdae..56fb2a43ecd0 100644
--- a/drivers/clk/mediatek/clk-mt8365-mm.c
+++ b/drivers/clk/mediatek/clk-mt8365-mm.c
@@ -85,7 +85,7 @@ MODULE_DEVICE_TABLE(platform, clk_mt8365_mm_id_table);
 
 static struct platform_driver clk_mt8365_mm_drv = {
 	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.remove = mtk_clk_pdev_remove,
 	.driver = {
 		.name = "clk-mt8365-mm",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8365-vdec.c b/drivers/clk/mediatek/clk-mt8365-vdec.c
index 1be0b3faa2c3..f5d0518bc2e0 100644
--- a/drivers/clk/mediatek/clk-mt8365-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8365-vdec.c
@@ -54,7 +54,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8365_vdec);
 
 static struct platform_driver clk_mt8365_vdec_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8365-vdec",
 		.of_match_table = of_match_clk_mt8365_vdec,
diff --git a/drivers/clk/mediatek/clk-mt8365-venc.c b/drivers/clk/mediatek/clk-mt8365-venc.c
index 4228ddec5657..35abd908537c 100644
--- a/drivers/clk/mediatek/clk-mt8365-venc.c
+++ b/drivers/clk/mediatek/clk-mt8365-venc.c
@@ -43,7 +43,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8365_venc);
 
 static struct platform_driver clk_mt8365_venc_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8365-venc",
 		.of_match_table = of_match_clk_mt8365_venc,
diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
index 485b525b8acd..e7952121112e 100644
--- a/drivers/clk/mediatek/clk-mt8365.c
+++ b/drivers/clk/mediatek/clk-mt8365.c
@@ -809,7 +809,7 @@ static struct platform_driver clk_mt8365_drv = {
 		.of_match_table = of_match_clk_mt8365,
 	},
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt8365_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt8516-aud.c b/drivers/clk/mediatek/clk-mt8516-aud.c
index 53e1866fb8e2..6227635fd5a1 100644
--- a/drivers/clk/mediatek/clk-mt8516-aud.c
+++ b/drivers/clk/mediatek/clk-mt8516-aud.c
@@ -53,7 +53,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8516_aud);
 
 static struct platform_driver clk_mt8516_aud_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8516-aud",
 		.of_match_table = of_match_clk_mt8516_aud,
diff --git a/drivers/clk/mediatek/clk-mt8516.c b/drivers/clk/mediatek/clk-mt8516.c
index b8ae837c59dc..21eb052b0a53 100644
--- a/drivers/clk/mediatek/clk-mt8516.c
+++ b/drivers/clk/mediatek/clk-mt8516.c
@@ -669,7 +669,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8516);
 
 static struct platform_driver clk_mt8516_drv = {
 	.probe = mtk_clk_simple_probe,
-	.remove_new = mtk_clk_simple_remove,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8516",
 		.of_match_table = of_match_clk_mt8516,
diff --git a/drivers/clk/mmp/clk-audio.c b/drivers/clk/mmp/clk-audio.c
index ae521aaf8cdc..88d798d510cd 100644
--- a/drivers/clk/mmp/clk-audio.c
+++ b/drivers/clk/mmp/clk-audio.c
@@ -436,7 +436,7 @@ static struct platform_driver mmp2_audio_clk_driver = {
 		.pm = &mmp2_audio_clk_pm_ops,
 	},
 	.probe = mmp2_audio_clk_probe,
-	.remove_new = mmp2_audio_clk_remove,
+	.remove = mmp2_audio_clk_remove,
 };
 module_platform_driver(mmp2_audio_clk_driver);
 
diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 8701a58a5804..13906e31bef8 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -792,7 +792,7 @@ static void armada_3700_periph_clock_remove(struct platform_device *pdev)
 
 static struct platform_driver armada_3700_periph_clock_driver = {
 	.probe = armada_3700_periph_clock_probe,
-	.remove_new = armada_3700_periph_clock_remove,
+	.remove = armada_3700_periph_clock_remove,
 	.driver		= {
 		.name	= "marvell-armada-3700-periph-clock",
 		.of_match_table = armada_3700_periph_clock_of_match,
diff --git a/drivers/clk/mvebu/armada-37xx-tbg.c b/drivers/clk/mvebu/armada-37xx-tbg.c
index e94c336e0f1c..1a16f9c0b1d8 100644
--- a/drivers/clk/mvebu/armada-37xx-tbg.c
+++ b/drivers/clk/mvebu/armada-37xx-tbg.c
@@ -141,7 +141,7 @@ static const struct of_device_id armada_3700_tbg_clock_of_match[] = {
 
 static struct platform_driver armada_3700_tbg_clock_driver = {
 	.probe = armada_3700_tbg_clock_probe,
-	.remove_new = armada_3700_tbg_clock_remove,
+	.remove = armada_3700_tbg_clock_remove,
 	.driver		= {
 		.name	= "marvell-armada-3700-tbg-clock",
 		.of_match_table = armada_3700_tbg_clock_of_match,
diff --git a/drivers/clk/mvebu/armada-37xx-xtal.c b/drivers/clk/mvebu/armada-37xx-xtal.c
index 0e2e7d00ae11..ca88e5e78b06 100644
--- a/drivers/clk/mvebu/armada-37xx-xtal.c
+++ b/drivers/clk/mvebu/armada-37xx-xtal.c
@@ -77,7 +77,7 @@ static const struct of_device_id armada_3700_xtal_clock_of_match[] = {
 
 static struct platform_driver armada_3700_xtal_clock_driver = {
 	.probe = armada_3700_xtal_clock_probe,
-	.remove_new = armada_3700_xtal_clock_remove,
+	.remove = armada_3700_xtal_clock_remove,
 	.driver		= {
 		.name	= "marvell-armada-3700-xtal-clock",
 		.of_match_table = armada_3700_xtal_clock_of_match,
diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index ce57b333ec99..ef31386831eb 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -128,7 +128,7 @@ static void qcom_apcs_msm8916_clk_remove(struct platform_device *pdev)
 
 static struct platform_driver qcom_apcs_msm8916_clk_driver = {
 	.probe = qcom_apcs_msm8916_clk_probe,
-	.remove_new = qcom_apcs_msm8916_clk_remove,
+	.remove = qcom_apcs_msm8916_clk_remove,
 	.driver = {
 		.name = "qcom-apcs-msm8916-clk",
 	},
diff --git a/drivers/clk/qcom/apcs-sdx55.c b/drivers/clk/qcom/apcs-sdx55.c
index d644e6e1f8b7..76ece6c4a969 100644
--- a/drivers/clk/qcom/apcs-sdx55.c
+++ b/drivers/clk/qcom/apcs-sdx55.c
@@ -131,7 +131,7 @@ static void qcom_apcs_sdx55_clk_remove(struct platform_device *pdev)
 
 static struct platform_driver qcom_apcs_sdx55_clk_driver = {
 	.probe = qcom_apcs_sdx55_clk_probe,
-	.remove_new = qcom_apcs_sdx55_clk_remove,
+	.remove = qcom_apcs_sdx55_clk_remove,
 	.driver = {
 		.name = "qcom-sdx55-acps-clk",
 	},
diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
index f5fd1ff9c6c9..ce4efcd995ea 100644
--- a/drivers/clk/qcom/clk-cbf-8996.c
+++ b/drivers/clk/qcom/clk-cbf-8996.c
@@ -346,7 +346,7 @@ MODULE_DEVICE_TABLE(of, qcom_msm8996_cbf_match_table);
 
 static struct platform_driver qcom_msm8996_cbf_driver = {
 	.probe = qcom_msm8996_cbf_probe,
-	.remove_new = qcom_msm8996_cbf_remove,
+	.remove = qcom_msm8996_cbf_remove,
 	.driver = {
 		.name = "qcom-msm8996-cbf",
 		.of_match_table = qcom_msm8996_cbf_match_table,
diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index a82a8212e322..9ddce11db6df 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -3761,7 +3761,7 @@ static void gcc_msm8960_remove(struct platform_device *pdev)
 
 static struct platform_driver gcc_msm8960_driver = {
 	.probe		= gcc_msm8960_probe,
-	.remove_new	= gcc_msm8960_remove,
+	.remove		= gcc_msm8960_remove,
 	.driver		= {
 		.name	= "gcc-msm8960",
 		.of_match_table = gcc_msm8960_match_table,
diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/renesas/rcar-usb2-clock-sel.c
index de4896cf5f40..421ae973ea8e 100644
--- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
+++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
@@ -212,7 +212,7 @@ static struct platform_driver rcar_usb2_clock_sel_driver = {
 		.pm	= &rcar_usb2_clock_sel_pm_ops,
 	},
 	.probe		= rcar_usb2_clock_sel_probe,
-	.remove_new	= rcar_usb2_clock_sel_remove,
+	.remove		= rcar_usb2_clock_sel_remove,
 };
 builtin_platform_driver(rcar_usb2_clock_sel_driver);
 
diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index e44b172d7255..abd49edcf707 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -292,7 +292,7 @@ static struct platform_driver exynos_audss_clk_driver = {
 		.pm = &exynos_audss_clk_pm_ops,
 	},
 	.probe = exynos_audss_clk_probe,
-	.remove_new = exynos_audss_clk_remove,
+	.remove = exynos_audss_clk_remove,
 };
 
 module_platform_driver(exynos_audss_clk_driver);
diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 89cf2000884f..2ef5748c139b 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -241,7 +241,7 @@ static struct platform_driver exynos_clkout_driver = {
 		.pm = &exynos_clkout_pm_ops,
 	},
 	.probe = exynos_clkout_probe,
-	.remove_new = exynos_clkout_remove,
+	.remove = exynos_clkout_remove,
 };
 module_platform_driver(exynos_clkout_driver);
 
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-isp.c b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
index d3c85421f948..8c4c3a958a9f 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-isp.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
@@ -216,7 +216,7 @@ MODULE_DEVICE_TABLE(of, jh7110_ispcrg_match);
 
 static struct platform_driver jh7110_ispcrg_driver = {
 	.probe = jh7110_ispcrg_probe,
-	.remove_new = jh7110_ispcrg_remove,
+	.remove = jh7110_ispcrg_remove,
 	.driver = {
 		.name = "clk-starfive-jh7110-isp",
 		.of_match_table = jh7110_ispcrg_match,
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
index aabd0484ac23..04eeed199087 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
@@ -223,7 +223,7 @@ MODULE_DEVICE_TABLE(of, jh7110_voutcrg_match);
 
 static struct platform_driver jh7110_voutcrg_driver = {
 	.probe = jh7110_voutcrg_probe,
-	.remove_new = jh7110_voutcrg_remove,
+	.remove = jh7110_voutcrg_remove,
 	.driver = {
 		.name = "clk-starfive-jh7110-vout",
 		.of_match_table = jh7110_voutcrg_match,
diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index 7e2337297402..5fcc4c77c11f 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -2354,7 +2354,7 @@ static struct platform_driver stm32mp1_rcc_clocks_driver = {
 		.of_match_table = stm32mp1_match_data,
 	},
 	.probe = stm32mp1_rcc_clocks_probe,
-	.remove_new = stm32mp1_rcc_clocks_remove,
+	.remove = stm32mp1_rcc_clocks_remove,
 };
 
 static int __init stm32mp1_clocks_init(void)
diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index a9be4b56b2b7..0251618b82c8 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -635,7 +635,7 @@ static const struct dev_pm_ops tegra124_dfll_pm_ops = {
 
 static struct platform_driver tegra124_dfll_fcpu_driver = {
 	.probe = tegra124_dfll_fcpu_probe,
-	.remove_new = tegra124_dfll_fcpu_remove,
+	.remove = tegra124_dfll_fcpu_remove,
 	.driver = {
 		.name = "tegra124-dfll",
 		.of_match_table = tegra124_dfll_fcpu_of_match,
diff --git a/drivers/clk/ti/adpll.c b/drivers/clk/ti/adpll.c
index 6121020b4b38..e305fcbac647 100644
--- a/drivers/clk/ti/adpll.c
+++ b/drivers/clk/ti/adpll.c
@@ -934,7 +934,7 @@ static struct platform_driver ti_adpll_driver = {
 		.of_match_table = ti_adpll_match,
 	},
 	.probe = ti_adpll_probe,
-	.remove_new = ti_adpll_remove,
+	.remove = ti_adpll_remove,
 };
 
 static int __init ti_adpll_init(void)
diff --git a/drivers/clk/x86/clk-fch.c b/drivers/clk/x86/clk-fch.c
index aed7d22fae63..cf5cd3ad4647 100644
--- a/drivers/clk/x86/clk-fch.c
+++ b/drivers/clk/x86/clk-fch.c
@@ -115,6 +115,6 @@ static struct platform_driver fch_clk_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = fch_clk_probe,
-	.remove_new = fch_clk_remove,
+	.remove = fch_clk_remove,
 };
 builtin_platform_driver(fch_clk_driver);
diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
index 5ec9255e33fa..99291ba65da7 100644
--- a/drivers/clk/x86/clk-pmc-atom.c
+++ b/drivers/clk/x86/clk-pmc-atom.c
@@ -373,6 +373,6 @@ static struct platform_driver plt_clk_driver = {
 		.name = "clk-pmc-atom",
 	},
 	.probe = plt_clk_probe,
-	.remove_new = plt_clk_remove,
+	.remove = plt_clk_remove,
 };
 builtin_platform_driver(plt_clk_driver);
diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 19eb3fb7ae31..7a0269bdfbb3 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1257,7 +1257,7 @@ static struct platform_driver clk_wzrd_driver = {
 		.pm = &clk_wzrd_dev_pm_ops,
 	},
 	.probe = clk_wzrd_probe,
-	.remove_new = clk_wzrd_remove,
+	.remove = clk_wzrd_remove,
 };
 module_platform_driver(clk_wzrd_driver);
 
diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index d983fab12756..81501b48412e 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -729,7 +729,7 @@ static struct platform_driver xvcu_driver = {
 		.of_match_table = xvcu_of_id_table,
 	},
 	.probe                  = xvcu_probe,
-	.remove_new             = xvcu_remove,
+	.remove                 = xvcu_remove,
 };
 
 module_platform_driver(xvcu_driver);

base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
-- 
2.45.2


