Return-Path: <linux-omap+bounces-2867-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 319EE9F937C
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 14:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 871D416A2F0
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 13:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB9C216385;
	Fri, 20 Dec 2024 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HVD7FQWe"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09BA215F56
	for <linux-omap@vger.kernel.org>; Fri, 20 Dec 2024 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734702305; cv=none; b=oeIKyf3XTn5f/5+IfJF75A4IfLExF3yBo4yN77am/H5Qhzg4k4JkFtvT2J6yz3RV+ZJiETFehs4vrXaKKOIG6qRJAgL6RIHLDoatfc7bWi91kWSgMR/aHd1EFi8JUD378eYdeLgnBtl4TxHPX5PaYP2abIEx4/pq3lK0Lorz26E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734702305; c=relaxed/simple;
	bh=dX3dLVzEJaAoihIPqwJ3RhQC9WoQ7m6Mh/cZ6nw03bM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UVFHxNq1sosPsmgsy8m+a20K9PF3bOaC4Hc19Dw7JskdTnVBHCognzVfr5z3D0BjlI2Kb5TBqVzCS9rX5ckThgHV49Y56HKljSZq8PzqtCWRRO2NYHbLsKEeFzrUPk5Vb2YyfovdYxB5IsjeumQneAxxhaTG7+ylCOgk8WcSRUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HVD7FQWe; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385df53e559so1542962f8f.3
        for <linux-omap@vger.kernel.org>; Fri, 20 Dec 2024 05:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734702302; x=1735307102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfOK5uiy+mcVMxtUQsmkMv7JKC5xMSpiG4Eomz9m2Fc=;
        b=HVD7FQWe72tioPx0MBEp66l2RWZNs8qQ1HiiXZmUmVeWIQsUi/qLrx8Q/HuBSXXIzQ
         RTJP2Yc0aWFPNobIZUrA69DKS1w+AL/2H4lnWR/1Pvv2oSXf6ygXIqFufPqFcFDcgFvX
         OyzKwbjmVxY9Id7+dzbAnm7L/x6Jm3a2wOSdN01OI+WvUWiihdBAlWqmbdJz04/Bh4v0
         d8UHU6vzRI3K6NiwGGxoMh+HYFrzQFJ+wGpcLdRaYweX1nO6fkYuDh7IaqKxRHzyDQcK
         4ZG0BEKl4tNkyhtSsbb99ibTJAROmO8zGQJyTlysaJzjg3f++quSzTwb77afvJWRnKfp
         W03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702302; x=1735307102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfOK5uiy+mcVMxtUQsmkMv7JKC5xMSpiG4Eomz9m2Fc=;
        b=ul2ue8Nw6CzZM1kJQJuk34j7izUsAN3yY6m7jKJ0xTwMMjEUkgjSb0vB32SavffDrO
         Tkyf6kjovNgmcWX4z6us6R/dUouHeX+Tr37imwbAA1Xyh2kwmtzLLeGizO/Zk3uC1x6n
         DFszb9KnJbqGYYmoKlEQI203CFnAmpskG6Ngxk24bDnrXEjSIF1J1q9vgMLvXgFA2fny
         qlKWZ5PNhs164XqRXZBaVZ8ZejhG2JJRx7n/eiwro20pbOuYAHW097PHoNUruIsUuROn
         vcjyN7CQTD7X3GobZw0DNwC4kRVnUgbdEJLYJbrNni6vuX8ZK1gzPG1uDPsdeIg5YX0f
         Oywg==
X-Forwarded-Encrypted: i=1; AJvYcCXkQRuFgHII/lnJ2iLPf+YEctpK2BcJvXgaI5eAQiWfQ/T4gjWwviP5EVeE5p6RY6M3aeB/QoAhCTT6@vger.kernel.org
X-Gm-Message-State: AOJu0YwDHd7I/Pk985XAloCcJBrTlMm4CkulWwCktw1LdhPjYAEakMhw
	iWdeb2nvppL0QNdwGNXo6POr6B6yVFPvyjPeYU1h9g5uOSrbgDcKtASQ+xdtXY4=
X-Gm-Gg: ASbGncvrcmuAqSPtbQNLZ/nvmMsSsUzVs5yYdb1XIdBFPT2t3Kr80jg+sHf7btY8WCf
	Id0lsNh9aDtSEiTGtJsrw21KH21fRC1nqFaTCOCbLSAdly2CR+wqlq4QTU+bi7peoRMdD5kT9UR
	KVSheM8+vaUVZCBqnKdtZGF/9cZNIvs+c2VphYoGckLYKmSwc54JUtuZtiq57RA0KbLKc9X+WQk
	/XY5xpIFuUqy6+Tcs6paeZw2Ci5wlr0bsV4zD3yYt4A0KrVNwXPaWB1
X-Google-Smtp-Source: AGHT+IE1zEfigu5Mqn/L6p1rvtHRRbDE8DUt16pdkH274SPWSfK8ipVLQmqYILs32ti77b+wRtiBXw==
X-Received: by 2002:a5d:5e09:0:b0:385:ddd2:6ab7 with SMTP id ffacd0b85a97d-38a2240874bmr3173475f8f.52.1734702302061;
        Fri, 20 Dec 2024 05:45:02 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:72db:1014:577a:9e6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43664b15365sm30191375e9.7.2024.12.20.05.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 05:45:01 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	m-leonard@ti.com,
	praneeth@ti.com
Subject: Re: [PATCH v1 0/1] TPS65219 GPIO Driver Cleanup Series
Date: Fri, 20 Dec 2024 14:45:00 +0100
Message-ID: <173470229783.43469.10272596710530652292.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217204755.1011731-1-s-ramamoorthy@ti.com>
References: <20241217204755.1011731-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 17 Dec 2024 14:47:54 -0600, Shree Ramamoorthy wrote:
> This series is in preparation to add 2 PMIC devices to the TPS65219 driver.
> 
> The changes involve using existing helper macros to simplify code. The
> intention is to remove unnecessary noise from the new PMIC patches adding
> support to this driver.
> 
> Shree Ramamoorthy (1):
>   gpio: tps65219: Use existing kernel gpio macros
> 
> [...]

Applied, thanks!

[1/1] gpio: tps65219: Use existing kernel gpio macros
      commit: c9ec045fa8053820573efbaa70137d0857e444db

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

