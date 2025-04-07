Return-Path: <linux-omap+bounces-3538-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB42A7D5F6
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 09:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5B6D3A4B54
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 07:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF3322B8D9;
	Mon,  7 Apr 2025 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="d+ZKdVxh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40F22B5AD
	for <linux-omap@vger.kernel.org>; Mon,  7 Apr 2025 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010485; cv=none; b=hdWFk7POdwZ+SK43Mv+eVAHXV9huex/w909efFNhbaVM1l/BqUPOc+/MTWHKe5HZv5nCJyi055qxLkhDqoZZDoQNKb70l5/Tyd/h8zp4uoQCCEFNy2oVMBH3bGpNqS5T+NZwooAmycByJv9M5fbqIM3VhTSmFA6pB2kYGDD2p78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010485; c=relaxed/simple;
	bh=G5BhxWKBbXgp0hqNK0eP2RvhQKS5wVohdK+Cskejh0E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MZmjRePKO9DlB5j+mPvrexScELTjfENT6HCj9TSmKP+hTiPRiALMS/VSkBHbK92WkFE/Sz66V+JZqR+8qq3cxVhcem1MmoYdDjKMmIa5/0EnCMlPwKF4eH3/z1WVJmSNXHVzShcYDC2PiFvUVynISIjun/Eptc7i3m+TXe7y6gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=d+ZKdVxh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso43401505e9.0
        for <linux-omap@vger.kernel.org>; Mon, 07 Apr 2025 00:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010482; x=1744615282; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3rn1KdFJ/AqShrvU/Gc3KSw9wUJ6mAkmkxSw61iKgtg=;
        b=d+ZKdVxhk/rJ3zS9ZTFVp2jGL1cNQRZK7CzuBWKig4cATYsQpSx9AmdMOenKQBjqcZ
         bOiKqL12INBw94zcuchoG8WN478tsgYqTV24ldWPUlhzXxxW9KsXtei0IK7rr0ci3KVx
         wbvRl3hBNEmHytaBgtn1Hz6CvHYgI8s59ZoV4C8+j5S8ix+W/J7q1j45fxBhZH7I/5yg
         B47u5EEylWkHWpR11Ai/mqz8hv1nqhVs4ukrpyGHnYoGC6bb03cLRyTnetU+NF31fPkI
         6bwBMCwq7M+vitlMWnapWUoE9a73yqGlnTQ6lAXkb8i5Z3J8m68azI78Xt85MS4avWBV
         A6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010482; x=1744615282;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rn1KdFJ/AqShrvU/Gc3KSw9wUJ6mAkmkxSw61iKgtg=;
        b=UgWxHHiCsgMq9QBkTiMpYyhqVzImlxvL6b+bew87P77J2zLz+xOPFl/H7tFMN/H9eJ
         94kyeiFjIkKQ0JcPe06bXoWjK6xf7MPhShiIUF9zuOTCLhCh48I2OlPAxBXZPx9OYE1F
         2Cx67gFfT2SvqPUtPn/Q97oYpgWBcjbLwctBpHS8WsHLheWIv5hlOM5ifkwN0TYFoYhM
         xk7IvbYnTbr2uq6SxIbRGL0ZdB4Xe+LiVcT7gsOXD2HPKpy8+Q6cRIEijk83Ssi6okCa
         5MeRQsjeeSypdSGl6mwEfJ8lyje0UvwlWCTOFymRIZtKurllRamQwXLsH+b3oE9E5Qc0
         0YWw==
X-Gm-Message-State: AOJu0Yw7+5htDe4W/VNY5Jo3n3s01d0iDy4n6GX79VZ46YV/hNLtmZbD
	ivpj/y73nl+Yo4rKAxvWUDu70zku5gz87xTio7DI+i3YJzPQjoUtu9c9Gb9OEQc=
X-Gm-Gg: ASbGncuo3+0AMQ7v5Eg7yW41u+DvIYyNyx4vWcgqq+2s0/zmOYvfBZXDzN2bszjH4sv
	WXePAFrVSWHnyUBq4fjgBEmg8KOJslZNGG1SzDcwODZ/VzteqrWtNgIQo3ANmFUZMAEr1NGK9Nv
	9k4yPEIFGb2mhGt3Xi5fXapsV1YWCsXKBm/tJhGMcv5fyAlVE84FwwlTTHCLUe5uDm2AcTNwDQK
	hMVFyjL0ZMN7ozWoKegxWNLsdwcCYrZmqZW/wjvoMIvou04OTj0Sspcpikd+e13K/PCd7hSv8T+
	P+CFH3jllXDl+ugojaJ1DWdZ107fsk2CUsNa2w==
X-Google-Smtp-Source: AGHT+IF3fwVNb2bYwy3gGcRdiJ6n2qvbc0eHaCUCLwGx5d/paU3tpQWJQL3gak9CAzdw/0GxBrYVVQ==
X-Received: by 2002:a05:600c:1387:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43ed0bde88amr115663405e9.13.1744010482599;
        Mon, 07 Apr 2025 00:21:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbd9csm119983655e9.20.2025.04.07.00.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:21:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] memory: omap-gpmc: improve the GPIO chip
 implementation
Date: Mon, 07 Apr 2025 09:21:18 +0200
Message-Id: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5882cC/x3MQQ5AMBBA0avIrE1CRSuuIhbUqFnQZipCGnfXW
 L7F/wkiCVOEvkggdHFkf2TUZQF2mw5HyEs2qEq1VaMMusDebhww0oly4U67lwc7M6+qsVrPZoI
 cB6GV7388jO/7AavQW1JoAAAA
To: Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=G5BhxWKBbXgp0hqNK0eP2RvhQKS5wVohdK+Cskejh0E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83zxNFy+D3OFGZQiHvVr2CLLklaekrUcVUbZP
 2oAph4muviJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N88QAKCRARpy6gFHHX
 cqgSD/9ORogsSvmUy6nkmE9Tdj5hGwclTRfgN5V5ZAkZ4h0MPIFpydP1HYQIrOQh3qs5YnYEjWw
 TjaUlOkOS8h1aRF1UHrcQIN3YqHCYNQV0c90/JAU93KxscLSDudGnTLhsAhEgf/7lASrHD+Pz2m
 8R5oCgIBjs0lVMlC1G8Mo1x7O+99MnLSgJ6c/rGjwmbiLcr+VJUTrwEnaaz4GnaNbb8FfuIlpVf
 MES2mGs5iiz5L9MFIVAhxG+OHy5SPNnYwoR2mwogdsGkeRVmlupPxSir+6pmwsj+uTXRljmnoUC
 Z6OeRr4ftM7oqU8dTx0RDAQGc2zj4bgQTK4oYdOk33XcgIWkrQVN4td1gSZvAt+q7/gUWsYtCx8
 sSHeEcJ2oi7iYwNbZzsIhWLP0OndRf8At/ysz37QrQ6BkAyz/vNAOY74iiDtTJP8F5rUXi2U/Qu
 nViaPE4rS8mhn80FWMpJGVUidb4shAHmQGJwM2ZeR7dofvBwyRlsmINs96tyk34NRuz6jskt+C6
 yVWGUBo44ySi0RHHVbvHHEFbdQAhxDZa5P9LFvBCCz0VQkgf6gL+C/Cd0z/1CVEffHR7ldNKQ/4
 VWXqcfStg1eKohXZwdfVb8dowdD/44XadeTBhusFiinOu8T65O+KSfv/+vB58nZj/mieQRMgaSj
 Okt2wBpbzS0tDvw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. However, this
driver doesn't even need the set() callback so let's remove it
altogether.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      memory: omap-gpmc: use the dedicated define for GPIO direction
      memory: omap-gpmc: remove GPIO set() and direction_output() callbacks

 drivers/memory/omap-gpmc.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250327-gpiochip-set-rv-memory-87bf23c66b7a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


