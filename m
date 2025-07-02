Return-Path: <linux-omap+bounces-4020-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F12AF0F78
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 11:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEC414A0423
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 09:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC242472B5;
	Wed,  2 Jul 2025 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RDsrazUM"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A47323ED58
	for <linux-omap@vger.kernel.org>; Wed,  2 Jul 2025 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447655; cv=none; b=YjyZ1IkT/7gcul+h7j/Ewc4iJzvZWJkketbgu+fuY1O0qsF5yautvHzjdaFNGnEjUmUAaI59uEultsrID9FjOyn9SMMN52xZzqLb6gxInBIaCS9x+IpbBPrquK5kQdP5KJZR7zAD22k4MhMl7Q3y9TuxAW91145if8ccPcCOYSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447655; c=relaxed/simple;
	bh=sOHXpCVPzm/YZ8eTA3k3opAT2PwIqz3LxOM7hlnGd2U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B1u9MkdfDd9U+zq0dBLTwV56KqCEnaEp9lV8RgVvUZCDNoxMYfT5nWpeQRMFr/IZToKDMHzFVLY/p1nKEFVInM48Q7M4CACBiNpk3UfePMaeD/n0QavajA4nlfNvmRh1j1TqfAMxtLg/bbEF3kxDWzv9xb1bzz/5kIyGrLqZFfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RDsrazUM; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so4778484f8f.0
        for <linux-omap@vger.kernel.org>; Wed, 02 Jul 2025 02:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447651; x=1752052451; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeL948pEBrM0oIl1f+aZCIR6Mgw1zy0Mr+qFmSzolc8=;
        b=RDsrazUMrPNkDeDIjBHi1xpoderahxDFiHs7Qy32Kvfa2mzONLnoEnCuL8nnGETY1+
         ukS3ClTgePoL6M0G+xHgEZIQxL89Au99E8nH+RAAFtb57DI3u6N14Kf54SC0ZrCZER3j
         Lf9b63mgDMOLtttNTCimRnBGBK2/GX7YYtkoieQF0PNY0pf7TUYUtu3tB7o9m46FTqvU
         PHfGqH2q/S4NXPiHEcfawhfi3WFDav5CC8L3t47ucSalMqRm1/PPMFa9ODEjqzSeYpco
         o/xUn9Jb/Vj4DkskCJNuYtn8K/o6kWUIgxvfw1OECBRtXl64vMD6SHU/W5Ltg2Rq7s1y
         wmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447651; x=1752052451;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeL948pEBrM0oIl1f+aZCIR6Mgw1zy0Mr+qFmSzolc8=;
        b=X0QNKimV8X5nFEa0iv2FWRodQDhjsrTh3OsJnBMd+YvKkcP3PQva28udL+VUNeN5Cm
         pQK5DRk3BsZ40LL9jStM5PsVCJHqShftBgbGfI6DJIPFyf/2y1MaHcLAKp/rg/MIu4S1
         gQl1PTj3HdrC8/M9F5c63h/z5xNz+YNPc2oLcdRuGfNkf+EEBpBMs4sep+JEi4GFejYs
         +eajhlhMef7DZRWWHDkOHPNbLceVPu8GELmKxjrefhqrjYGWAc3U0pvcWV8iSqpoIre1
         FVWly577vQDmkidVigG3pqeBC9ipuyc/y0gHWLpd+mD37bdBUG8uAp305VkMPgo2J099
         mspg==
X-Forwarded-Encrypted: i=1; AJvYcCW3tJRLbTeukXPC9KW44pi+h5qZGZQvll65BDHQN3Rak9T5bkILjoW+NWLiSh0MRJsYuDiPeonJgsMS@vger.kernel.org
X-Gm-Message-State: AOJu0YzRZ4EQA6DH0HqkVqKO1UPvpNDh5BN+eNfELFoz+h6xVe+JH98s
	cPddPkhM4vCV7+ZThOPejJfakp4J0EYYTUGvDn/71Bf/VEUAWc9v1mYnD3UzHPtiNmo=
X-Gm-Gg: ASbGncsdJPtCx+un661Up093M2EZrD3SIOQ8lHAzACMoufWvYHRT5zaXZtfw+RoadHy
	y8m7JphbZShrE4mBasWYVXphFbSPcgcITdogBSckZGsPBynKRL81ODUsqzn47OMl9xzO3C3RQne
	KeP2MqenBM6qA/irzvDVIPy3FOmE2hz2XLtHc/QNJahQ5sW6cOclVv9WlxdU5XcvJ3k8TXsjJbj
	eEIh8ZUYiHs2pj3Tn5extxZYC8U3ush5criuOCfbHzktG/ssRHLIdhUnZQwb0SneNB/sFvrNVAI
	Eei8uo8npXiBybsgROUUHbie3VVo24LpKfaCp7XQAAVszY/HmCgECtUWegKcTpDX
X-Google-Smtp-Source: AGHT+IF9qG6a/NsxMnQIVPPTepsmvFx1KpI71XHtS998Sg2pHfCt5jeNuVXluvHxs9EveU4oGvY4NQ==
X-Received: by 2002:a05:6000:2010:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3b1f93550ddmr1557563f8f.23.1751447650851;
        Wed, 02 Jul 2025 02:14:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Wed, 02 Jul 2025 11:14:01 +0200
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFn4ZGgC/x3MQQqAIBAAwK/Enlsww6i+Eh3M1tqLyloRRH9PO
 s5lHsgkTBnG6gGhizPHUNDUFbjdho2Q12LQShvV6Q63xNHtnDDTgXL9RolnWFs0/eIHMzhtlYc
 yJCHP979P8/t+syLfq20AAAA=
X-Change-ID: 20250626-gpiochip-set-rv-gpio-round3-58bf959c2a0f
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Robert Richter <rric@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1932;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sOHXpCVPzm/YZ8eTA3k3opAT2PwIqz3LxOM7hlnGd2U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhfrB5jN1miCdxSaAbtD6Deiu66lCqZxBf/f
 1GxNm7l3hSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4XwAKCRARpy6gFHHX
 cl+MD/9PPdqRVBA6/Hn/VbSzDey+uQh7kYAOPnM8zK0b4dKV1xjIuJ7OX6GkMP/n5VHrNM/+g5h
 7aa/TlZyIZLoddPuXkEbiX4J3EZwFt8ERcEjr8GcyudkM2f5X0C6ELBRdTXdXCv0mTRebyysT4j
 uHocpFdhBfZhPWKKurizzAsu7IXiC+9XqvQAcgy3XyfQCH52x2cTLVbh4SoYRML8bNJsgsLfdfR
 h8cO3hRtimKAImdew5URtusgBjsMlUO1RtQYmQxshT80hLJzTrJnCgTtiSOjY24daJXJ8Zwb82+
 yXQgPWzbJT5FNVXOM4Hz1ZTV0aeeuM8DKmR7KJX2iQ9QEvqiN7hw3EYPH9QObeKHHhDkxT10VfC
 UC1Njtu7F2iHriDpuya14mroFTTIXzoGZmiP0e5YSAUPg9W9O3JDH0ZQ/rdHe5RoHYHgv97BvSn
 bQqFQkqRZ+K+5XcdANfrjKfTpCzNqmVt79kwt1eu2R9dN4T2mqhQcSNrSPhr1ks7gwWXRbwAgCh
 s1YjrQNwDDmi8RdBXxZeG6K69Tu/DjxneG9FZ54Q2qfPaOlwQCmDrzZNuDxobuBQ3siG4QEiDQ7
 FaektdzkG1y1jUGeLqBD3nsAMqy5ytUeisckSR60mbikkhNO6AQDoXhb9hPP4RTOt28ZixG1ZYi
 q9DO0A1TJp6u4Sw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: tegra186: don't call the set() callback directly
      gpio: tegra186: use new GPIO line value setter callbacks
      gpio: tegra: use new GPIO line value setter callbacks
      gpio: thunderx: use new GPIO line value setter callbacks
      gpio: timberdale: use new GPIO line value setter callbacks
      gpio: tpic2810: remove unneeded callbacks
      gpio: tpic2810: use new GPIO line value setter callbacks
      gpio: tps65086: use new GPIO line value setter callbacks
      gpio: tps65218: remove unneeded callbacks
      gpio: tps65218: use new GPIO line value setter callbacks
      gpio: tps65219: use new GPIO line value setter callbacks
      gpio: tps6586x: use new GPIO line value setter callbacks

 drivers/gpio/gpio-tegra.c      |  8 ++++---
 drivers/gpio/gpio-tegra186.c   | 49 +++++++++++++++++++++++-------------------
 drivers/gpio/gpio-thunderx.c   | 18 ++++++++++------
 drivers/gpio/gpio-timberdale.c |  7 +++---
 drivers/gpio/gpio-tpic2810.c   | 27 ++++++++++-------------
 drivers/gpio/gpio-tps65086.c   | 16 ++++++--------
 drivers/gpio/gpio-tps65218.c   | 31 +++++++++++---------------
 drivers/gpio/gpio-tps65219.c   |  9 ++++----
 drivers/gpio/gpio-tps6586x.c   | 15 +++++++------
 9 files changed, 89 insertions(+), 91 deletions(-)
---
base-commit: 3f804361f3b9af33e00b90ec9cb5afcc96831e60
change-id: 20250626-gpiochip-set-rv-gpio-round3-58bf959c2a0f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


