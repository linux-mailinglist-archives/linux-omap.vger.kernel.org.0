Return-Path: <linux-omap+bounces-1573-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60342911462
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jun 2024 23:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C249281A0C
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jun 2024 21:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D063823DC;
	Thu, 20 Jun 2024 21:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yvmc7sq8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D337E572;
	Thu, 20 Jun 2024 21:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718918580; cv=none; b=IK+vPLIi6ydWSyIj/qpUP068wd0A2fZTi42d1SrB3t32md0Ub0W709QH2V5fHpb7S0PM5IINYYnr9NuMbl48PDv/zMPwViDopRJDpn1XS9VxSrVgWPrLMso7dgT0+uOMNGD1fXvjMy3gUc/NXKFGMsQNIAt4ofxsMq16SAASXWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718918580; c=relaxed/simple;
	bh=lIk21poydkHZA9G6tN8B5DcddOq3+4kRdZcXWZ3eiDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kn3kQ2Q3pgT5bgoK+F/rJVRDk/37/BKNU+4BQrF58soeWn8vTS24Iknl4TbO4l45HCPZmDmHeRmwTWcL0G33iIMcapVlJdmrl0XCvWNJDdkR04bNHbH77MDHnv2Qzw9OCF3ekhVSGZr4zbf9hREbyUDc/Xx3R/UUG6cpTsiQwFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yvmc7sq8; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a6f04afcce1so158304366b.2;
        Thu, 20 Jun 2024 14:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718918577; x=1719523377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neE7INAukEKjE2SAP61WvkGQBYpsrnRiNjBLU4VnvgE=;
        b=Yvmc7sq83eypaEujZSjM9QXDY6so0uLO5irAyJjxY1bSULvkq5+Cu84HQARvyrUrms
         60+MgelzI/YyJqT3n1Lh1T7O7xj2KSQTKzp2xuD7m83GYSo7u4kQOSmW/STD9xB4nd4b
         VzTK+7zD9J45KPxbk0L2QW/ep5Z2diyiEYud0Ax0BrhXnxS9RUcaazfau0OFw6NMdKP/
         dYt0eBxWbVRpe1tCoUi9P8YeMjqCVMmh3XaX852tEEd9s0A94YWhbu65tZCFGyXF8ywi
         Euo7wNTOTODC8s8cl0QgDaOkQEDDJewW7Ppq8uBbATrq+PioJFlTt9GlnvGYbeoPMZFX
         GCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718918577; x=1719523377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neE7INAukEKjE2SAP61WvkGQBYpsrnRiNjBLU4VnvgE=;
        b=WL8xOAM4h+dZircJMWBaRuuqJvVj+HJoy6CRgr2dw7RRL1c5P5O6nel2WTQUdcUOF/
         0qfuOcIhYI/cLwNyErWTUb1Gw++9LlgzRNuBiRVJbLHve35Jmm0Zrdwl1XDoiWUuJ4DA
         4sOeu3AbnKKTgkT+9SgFyFLexrboZygrPtvD0I6beyIvQcLcMSADha5RCshgQVl62YGg
         5qsI8ux+jtcZJfQglnCPqDi6RIUZBJPIOmVeoylagfRb/UuujKWpOaJp73qmYamJKyUk
         iQwQ19gXf55CLWmEfYPXjHsbFxDhbtqSIruy05HAp0NP3O/xFieMrzI5niZOGRaDpsdW
         4nMg==
X-Forwarded-Encrypted: i=1; AJvYcCVh/6lh0F74kllQTqe1gVeq63fw6YJ28NQICn4653IaSAMbttnxty44D+KJqbX1NNBxnwPKoBc6dWYXxGhNEDbVwYU3X6J4HWFA3tGWj4AadavM4fVVZ7JFs54TjEJ8yIzLLtAlO/TqLc0f3tSV
X-Gm-Message-State: AOJu0YyS9EtP4iQtLqgx41pJ1eeACGdBMmdBuxlSZ54Nf64O6gJQMZb7
	2hUIEF/DmcK44QFOtf86pmowJkFnMlUmlDi1/pwQnRxKCNl30XGArgYl2ROP
X-Google-Smtp-Source: AGHT+IHE8ItVOOXbIoL6tYrHXRW76APqXsARzi48ADeaS42ghc3AmYrzBRdZpOM2u20JmJDU/Qzxgg==
X-Received: by 2002:a17:906:9c88:b0:a6f:b58f:ae47 with SMTP id a640c23a62f3a-a6fb58fba6emr494986866b.10.1718918576877;
        Thu, 20 Jun 2024 14:22:56 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560d82sm10922666b.172.2024.06.20.14.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:22:56 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 20 Jun 2024 23:22:33 +0200
Subject: [PATCH 1/2] mfd: omap-usb-tll: annotate struct usbtll_omap with
 __counted_by
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-omap-usb-tll-counted_by-v1-1-77797834bb9a@gmail.com>
References: <20240620-omap-usb-tll-counted_by-v1-0-77797834bb9a@gmail.com>
In-Reply-To: <20240620-omap-usb-tll-counted_by-v1-0-77797834bb9a@gmail.com>
To: Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718918573; l=894;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=lIk21poydkHZA9G6tN8B5DcddOq3+4kRdZcXWZ3eiDw=;
 b=OSYqIWUNEtCTr93tYWr99r1gbCF+xJchXhwy2mfzRxuz1aEP4QRMX8dMQ6kZdSzbRg3pQhOY6
 8eNfezEiTx4A3X4pljDQBN4SfsYZr+Nk2lsBMFTVndf+JUSeCeOl+0y
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the __counted_by compiler attribute for the "struct clk *ch_clk[]"
flexible array member to improve the results of array bound sanitizers.

The comments for the variables are no longer needed as it is now clear
what is what.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/omap-usb-tll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index b6303ddb013b..a091e5b0f21d 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -98,8 +98,8 @@
 
 struct usbtll_omap {
 	void __iomem	*base;
-	int		nch;		/* num. of channels */
-	struct clk	*ch_clk[];	/* must be the last member */
+	int		nch;
+	struct clk	*ch_clk[] __counted_by(nch);
 };
 
 /*-------------------------------------------------------------------------*/

-- 
2.40.1


