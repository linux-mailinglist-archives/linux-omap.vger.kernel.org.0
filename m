Return-Path: <linux-omap+bounces-4901-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085CC4FB0E
	for <lists+linux-omap@lfdr.de>; Tue, 11 Nov 2025 21:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E5504E1654
	for <lists+linux-omap@lfdr.de>; Tue, 11 Nov 2025 20:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BA233D6E9;
	Tue, 11 Nov 2025 20:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BjwEg+HX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A32C33D6DC
	for <linux-omap@vger.kernel.org>; Tue, 11 Nov 2025 20:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762892583; cv=none; b=RRKRN5AH/ryD8G15H4xwvRuM1ugS9apbb8WRwOqaxWp8PmDhAlZ2pFb9HU3lgVCIt1qutuVNo2hrgT8vVVHOqBsRYOWpG7LSET7mW8xG4o4EOUhYjshv8XfMSMXaH/DmggYh6hXMMXGSjNiYXpKq1t6DCETd7JpHF1e2wkUFppE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762892583; c=relaxed/simple;
	bh=uiEd6c08P9ZtzVlM6nVCfOwB8OhbrgYkhuf6sMbmKQo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iHnZ/4FVdCrFZB6kA1a8WjS7Nq+3TmT+V+thgxpvQOir3vyxzXUYLZhnSE3KFkxQUNK6rUCOp8USr3C8xz+N+yRQQgXg7v+9SRRveC3pLKLzR+8arxIamBmh/ubF5lx+siBTqpJF6Wu+XtKOCAVYVwbfmunWDqG9V9AhsX7vGTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BjwEg+HX; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aad4823079so122728b3a.0
        for <linux-omap@vger.kernel.org>; Tue, 11 Nov 2025 12:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762892581; x=1763497381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikDAnvDIDssJ4+W8IdyzEDxE5I172hkPwGOVsrFDDvA=;
        b=BjwEg+HX0Q+3HLtjvKcxzE3JF2W941ZmR/zhgqey2e4kkZU5PPHmgC5mogln/y+u4V
         qEXOYn/CUHsVnWG2sfpjlWhPr0xLoFIFfz6smB1BhfosMIX0q54V8McWTOX09V0j6sWn
         5/IUvvEIFc13AWHnPGGIafB002pIF6lxElow378M4zd/p/clVRFOHscOsBCUkKnujzdU
         wKy/ElggMDDoHaRz3L9IDjShxAVJMpcBBf/QR1e5DipN6fMRPM9YQhlQ2FK3cD7bfspo
         p38tLmQR+/mt4PJOnqmfkMG3Zklg7RfaeVl04bvC7coK2ugyIJCgkTzj4h4KPmju6XyY
         vGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762892581; x=1763497381;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ikDAnvDIDssJ4+W8IdyzEDxE5I172hkPwGOVsrFDDvA=;
        b=kxi5AFmLuM/HSNoyTo3cVJPI8/3HusCHFQrJyUM/n6QwEwX/TvmCkFyxmua6CrVUj7
         /OmLLs0ou+lSgdVLgelvT4cd8rAqATzBlvFXXaV5PMpsrYbP/bQmdmy2SQAbnnYtfjAv
         pYFvlJ5ECOjIHSIszqKQhEpK9W+Cb9/+qptCSZf3wnfv2F9y1XtCz3KTUhTX13FwwTk6
         Y5BnkRQIYGstyzGjqV028hggPL09Pa/Br1PoXTIykaSDrrXmp6C4jMhIDbPyTPGQkzG1
         uf8J357/hD4wqY8IyAn4UU2QA29mwLMDzWEZjYaWHXtzY1uJe7rJn4GaIbXn1a7xuc+L
         I0nA==
X-Gm-Message-State: AOJu0Yxl+LaL0NQJkvXcWS48JoWEwQjIQ54+tq5WuLFgEgrNejzcD148
	Lsm98R1eg3fa9OIydZeegYW3JxvhFSPEc4IeIgaGPBBBl7Z1IMCGtbpsaxoadRIIGRE=
X-Gm-Gg: ASbGncuogPkPqQFv9WpL1N4ddlk/Hnw+1qLPtqPpr5dFmKG05JuSCbvUJUwlVTBYVzN
	j6kxTWUZ9U/FSfAl2csdECmqOV68quTTCziuMeJfytPaGD3OjRS8ULXKRAkMW3IhLNoHH3ar8aX
	Qh8ZrCvyTTn3ewoitXKvA9RgSdqfgq1Z1QrI7svE1Xj3HFW0lE5danohHFzNO02qOCZW4oTQOSp
	w5fVSg0pjrUnPjD3npY9/jj8+loHrpXbjJQKyl6CsZGoq31nJdG3if7blASA1WbgT+1JWtEOl6d
	pFMdZIhpS0akYHuYaX9v0h0byxBaFvp5vTO5xszyXTLGF1yhCVwSqok7UGmDUi8iem/OuV+z+KE
	wrFbYwOl089s26Nk09TjE4SJQs4Jix3mBFFOei1v6FvTLpe2RuJjer9Cr4RgDV7D29eDXo5dwIQ
	==
X-Google-Smtp-Source: AGHT+IEcxltjr7ssXEmkIc5rphIAJmzjiRfaTOjm03RlC84h4y2Zqz/YKQc1p5nLLTJ1DDR9m4m42Q==
X-Received: by 2002:a05:6a00:b8b:b0:7ab:88:e397 with SMTP id d2e1a72fcca58-7b7a4fd9098mr310228b3a.24.1762892581246;
        Tue, 11 Nov 2025 12:23:01 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17784bsm16428895b3a.47.2025.11.11.12.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 12:23:00 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 George Kelly <george.kelly1097@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251108102741.47628-1-george.kelly1097@gmail.com>
References: <20251108102741.47628-1-george.kelly1097@gmail.com>
Subject: Re: [PATCH] ARM: dts: ti/omap: fix incorrect compatible string in
 internal eeprom node
Message-Id: <176289258052.3622788.10472289186351721450.b4-ty@baylibre.com>
Date: Tue, 11 Nov 2025 12:23:00 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Sat, 08 Nov 2025 05:27:41 -0500, George Kelly wrote:
> While the Beaglebone capes have the Atmel AT24C256 chip (256kbit or 32kB),
> the internal Beaglebone eeprom chip (i2c bus 0, addr 0x50), is an AT24C32
> (32kbit or 4kB). Yet the device tree lists AT24C256 as the compatible chip
> prior to this patch. You can confirm this by running
> `sudo hexdump -C /sys/bus/nvmem/devices/0-00500/nvmem`. You can see the
> factory data is repeated every 0x1000 addresses (every 4096 bytes or 32768
> bits). This is because the read command wraps around to reading 0x0000 when
> a user requests address 0x1000.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ti/omap: fix incorrect compatible string in internal eeprom node
      commit: 73f0769ebfc6473be084f0c52db25d2973097dd4

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


