Return-Path: <linux-omap+bounces-1839-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE4D948063
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 19:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5860280F84
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 17:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E95715EFA6;
	Mon,  5 Aug 2024 17:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yZkBFDLA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAAC481B9
	for <linux-omap@vger.kernel.org>; Mon,  5 Aug 2024 17:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722879455; cv=none; b=PjjB+YPIe1ZuRgl+lGOPkKqKuM2VbLJFw68NoPfSDJ7bLQigukeCRdt6HQkeG7fjNJi8DSaR3SK9k6weejkP6eFJfPMrnKDP3y1baqZGBJCIspmCMhQKbJdsUgSlZjxr+Gn6byBhghj08tlowCqv9NW11eiBYYYkzXtz08lr1LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722879455; c=relaxed/simple;
	bh=dM8sp0husClYi+h0ZGKuVSqRa7NAM23OUR7RjW40VYI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lzt7Wae9uCBnbECbkw/ia/6kjYyQyXGd1baMADY8gxXT4AQ1zJfISBFLoPwWQtGQycUlnelZaLhsxssj2A7Jtgs4R3Vka/BlGAZoF54Xh4TqQaiP/dXGkNJ+YqMMazsuYNZYA19y46ZEVMUxLv9ZC4JmudY1UlAZAOxAj6Mm4kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yZkBFDLA; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-26106ec9336so5201863fac.2
        for <linux-omap@vger.kernel.org>; Mon, 05 Aug 2024 10:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722879453; x=1723484253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pHVbhEoVEMjlU46Y+rdQzQBJK3R4JaIn8qB/k8iiR0=;
        b=yZkBFDLA0kwE4TFbrGdE4el5dCq5+I5XSfv6Yzo1PnJ3wa9AX8cPrJE/yf20rkLR5A
         Qq20H32SeClGolOu5+EHNREcj8ao0XmfprlkCqyZyRyalsf+Xg6clg4pl3jboBDKI36b
         G5aEGz49UaMWEcVCTr3H+cKgvf2a2/qxi0Auz0cIjmgv7gm0kY34ZA8cvVK9TXoYf3Tz
         b4+jQ7TWvmxchjJK/jhwftUymM4Pkjn+ReUQ0SpvciOHiG7TGlLsjWYSHAMDbhBUDR/c
         LQ7Mympyi0RGBpQHy0RE6/3JthtVLhhpyV7vT9CnDj39xlEfUWxGz7Ch4jmtASD7Xdpf
         gxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722879453; x=1723484253;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pHVbhEoVEMjlU46Y+rdQzQBJK3R4JaIn8qB/k8iiR0=;
        b=UVAOvk0dbTUcPeAl7/7CNmxiwhVuRgBkbAngk2LOo6uIKwrvajyAQznbPR3WzG3hdg
         Z1LNIl1iWQDUjNig5ziAy+2hVhqdpRhuAN+eWb4JT0+TxPsMBLvm9llsOYeD34OEuAsH
         VV9ounATIVTT6hOYYva9Z/8epdakq9uHY9ns/kY9An3MQ5pAdVg0xO3ncCtZkl035UxN
         xjoilNbqhObD6b+sc6TsjO4hiL9YuQ7EAuFNArtpB2GktglyiupRqDUCiYAvLnIS6uJR
         Sfdsx4DmaX89gtEXhQ3Z2iDfGFmIkUvbILTdga6IkEFtbCcE9p+Zl4Ni9zfO9J4WsLOK
         zNrA==
X-Gm-Message-State: AOJu0Yy+QYNma14rRqoBpBZSqHP5Q/LZUA9I9PykAZZq/N2Yt58x5hOZ
	995ldEWnx75Lkw8UYoQzpzBeeub7yPL6sj5ANGUYD9CrJoAkl1DayslXsimbN5s=
X-Google-Smtp-Source: AGHT+IHJRUtzcnsDnqI75o6X2Ap9E2ZssvYvQ/dHPTU1gm3UkNElVw+QddAP+HpNI1vqdUkkHvtRXw==
X-Received: by 2002:a05:6870:1699:b0:264:9484:a292 with SMTP id 586e51a60fabf-26891e92feemr12640386fac.38.1722879453369;
        Mon, 05 Aug 2024 10:37:33 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9f5cdsm5708307a12.2.2024.08.05.10.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:37:33 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240731191312.1710417-1-robh@kernel.org>
References: <20240731191312.1710417-1-robh@kernel.org>
Subject: Re: [PATCH] bus: ti-sysc: Use of_property_present()
Message-Id: <172287945269.306491.8860968743342697729.b4-ty@baylibre.com>
Date: Mon, 05 Aug 2024 10:37:32 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Wed, 31 Jul 2024 13:12:39 -0600, Rob Herring (Arm) wrote:
> Use of_property_present() to test for property presence rather than
> of_get_property(). This is part of a larger effort to remove callers
> of of_get_property() and similar functions. of_get_property() leaks
> the DT property data pointer which is a problem for dynamically
> allocated nodes which may be freed.
> 
> The code was also incorrectly assigning the return value to a 'struct
> property' pointer. It didn't matter as "prop" was never dereferenced.
> 
> [...]

Applied, thanks!

[1/1] bus: ti-sysc: Use of_property_present()
      commit: 0070dc29c85f0859a6071844b88fca6bce2974e4

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


