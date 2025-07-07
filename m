Return-Path: <linux-omap+bounces-4072-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D0AFBE08
	for <lists+linux-omap@lfdr.de>; Tue,  8 Jul 2025 00:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68B8B1AA8288
	for <lists+linux-omap@lfdr.de>; Mon,  7 Jul 2025 22:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5424328C024;
	Mon,  7 Jul 2025 22:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ro92zX6/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F95288C23
	for <linux-omap@vger.kernel.org>; Mon,  7 Jul 2025 22:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751925738; cv=none; b=HB/+uJjGL4MQEUf5iWKVMv3nPfw9fvpuqP6d7UTUf1B9a/recJnNxNjYMajQVt50GtuEIEY5SkqnLxtFUd33H9fDWV4Ilsy/fippqTXD8hYEuBrzKhZrUsrxptEsemefF8Dek1pgXdQWGewC+VHZfYUtwrk/NeTLfyiQwQEw/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751925738; c=relaxed/simple;
	bh=U63+hVcGdAhCrCBPzO6XFzhjfIMyc/+qKWMUmgBFHZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oiNCfrvn8aGBndAQzDjj5htKVCbIx0VCizrObMMDNvKNtJIGUhMHt7TM488XxqpTl0TbzGP4g32xVzS8L1bjDawXhuRRF4rXOGuXqFf+VtHseSjfdruVCLsnJDdsSu3f7hwdpH2S9NyYLyvmRh6EzqNOddQAgo2KfVKgfuoj2z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ro92zX6/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-748d982e92cso2308654b3a.1
        for <linux-omap@vger.kernel.org>; Mon, 07 Jul 2025 15:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751925735; x=1752530535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7bXLBC/9PX9YVcxygXI1zQaPaaYKOdSLh+6mu0LXDY=;
        b=ro92zX6/dG4C2qL0Ym/MPLhLtHrtVkeIwKvTpVrQMT7sUEtN1XH5xLAadQCGS3X9X+
         vPMzdUA1mHpg2c2eJBBSbYXYC7oPQG1x/R55uSshz53cI6gQYJXNL/Yj+Tx4g5YiqJy9
         vyiwCF7goCAVUl9Te7fWNiIOICgKzQmujfYgEJNNRGIGCMQra8+zvrlvgQ+pvJ0ri4KV
         3glb5ETc1j7fcTcbnxeBWiFVbgBmzXIBgDhpjBY/Nh7Juc+6v0MqCQr/RQXFGCipABkL
         w69vBwB/2q2rE+etGoYos+b9U87OItC3F+R8ICRlc6gLjt1GsUDW8Zmt9CqPOIYikovz
         U5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751925735; x=1752530535;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7bXLBC/9PX9YVcxygXI1zQaPaaYKOdSLh+6mu0LXDY=;
        b=Lh5ETOv1MFZkMlJwe86kB+BJ1hWJYfHdqSvK2IzFrtCnVKarrZvHOlJ6gPhMzwCmU4
         CC5c0Y1j7auz87WRk5jDUqGFhYUGGdrU6mtWHZKAbkZ4nAYgPL6x9FcrTjM4b/IB4NiS
         Idnjix0f9EnFvgKSw1efkjpUDlKPSoSTYcbRlk4bHCkU17169bw/IiEGvkwebt0hxKFo
         msTnOqt3LyXRcvpjhTPEw8E2GC6qJS71IfxcJTYYr0NLp2rXO9q4/9LYB/+9exOBkHBl
         Igu/Sg3CpYVZFD4nlq7J1jCY/pkhKWYkyFIAyAPeEApZtEA7dVJZaCgAEaQgdzXKwuDu
         zImg==
X-Forwarded-Encrypted: i=1; AJvYcCWZPx9IuaJM1erWNAqVp8A1D4IkdBdYfLC68ewqYJ9xeWegrZtOaxLW8a3A7KHVT28hxOTI9cOWLhxN@vger.kernel.org
X-Gm-Message-State: AOJu0YyVSQ3YFtDcYQTum5X5Zguhl9zz6betf2y13qo5c7M9ThYrsq5R
	BL4BFh99BeKTc3g8a7rZ02CtOhSd8+tM3qOaGrZ4ERtJY9Yq9wlJ+FoIk6jl3MB2OQxELvpaJvu
	GOR+ly9w=
X-Gm-Gg: ASbGncsYDCM1gEYR49YHeHIMKXgdGXVsDULWIjCBLjmWP7o4sx3L/BJB+8mgWhS1DMI
	L+U3tYlB83wsEKU8MEg4bzpBnlP+JkP34LbAj42VGUIJwsqjxb3wHcJAT2nGRpmxk9zNPRFOshF
	4LMcbHX3Mka5iE74QzFMpIJXwVdUCyt0bVx/71c3YGDl/tvIncUYvLYPcdbhS1OKffzE9bkYnwL
	J3lYznl/YgJJjLH8i1nGvSelRCcAOQMhx1FQ4N9j6cPH6MvegxmA4S/Aao9ImJU3tPDz8Hcu2rr
	JE8aL/oWTvMwfaJfWqv5jlmT5ksll1Xsk576enpcaNdfjUmRiHAioJeVr1bW
X-Google-Smtp-Source: AGHT+IH2E4VCCHXWLNSHKY0ptSlDn6FXFLO/VUWKKVCVfMN8qIO4HFHA+oy01iANm4u8NULqGn280A==
X-Received: by 2002:a05:6a20:e68d:b0:220:21bf:b112 with SMTP id adf61e73a8af0-22b42c05e4fmr1144292637.13.1751925735386;
        Mon, 07 Jul 2025 15:02:15 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42cefe4sm9419763b3a.157.2025.07.07.15.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:02:14 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 Felix Brack <fb@ltec.ch>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250529135324.182868-1-fb@ltec.ch>
References: <20250529135324.182868-1-fb@ltec.ch>
Subject: Re: [PATCH] ARM: dts: am335x-pdu001: Fix RS-485 transceiver
 switching
Message-Id: <175192573416.520018.17662868630583209501.b4-ty@baylibre.com>
Date: Mon, 07 Jul 2025 15:02:14 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Thu, 29 May 2025 15:53:24 +0200, Felix Brack wrote:
> The wiring of the RS-485 transceiver of UART0 of the PDU-001 board
> allows sending or receiving date exclusively. In other words: no
> character transmitted will ever be received.
> Hence the tx-filter counter in the OMAP serial driver can't work
> correctly as it relies on receiving the transmitted characters.
> This in turn will prevent reception of data unless we disable the
> tx-filter counter.
> This patch disables the tx-filter counter by enabling the DTS setting
> rs485-rx-during-tx. This might sound like the opposite to be done but
> it uses the enabling of rs485-rx-during-tx not for receiving the data
> transmitted but for disabling the tx-fiter counter.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: am335x-pdu001: Fix RS-485 transceiver switching
      commit: 539e87dd661f5ce321019c27ab15cad55345e429

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


