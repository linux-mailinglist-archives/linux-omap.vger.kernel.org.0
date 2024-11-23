Return-Path: <linux-omap+bounces-2723-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB59D6B18
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 20:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E85D9B21DC5
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 19:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95905189B80;
	Sat, 23 Nov 2024 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBSm2t6O"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA7D27466;
	Sat, 23 Nov 2024 19:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732390008; cv=none; b=aT8RO+NT/ru1MlLVFeZF4ktxtpz5a3f4Kde79lO0DexVsVZLH6Q+4qdKZzhJGyqPYYTaUvkKIKduJVv/71hbkNmh78MFowbpw9U8v2dG03M1gXRqSLBRU093gX8rnUA27BdlDODmyoCnFKhbWoUH16vxpblnNVw5nk5CN0Pe2GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732390008; c=relaxed/simple;
	bh=8C0Kv2tQGtcVzLErsh8vX7WrbQjr8sudBmB1xAP8Xf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grVRalJYKqRjKVpcSKUrLE4kz/HLPxEzmWZVcOEq2HkmqtwHVcNjevayWPjiiB1Ag0BtOqRvZTNNW9nEwUgg+KY5vggsPVOz1kDd5YUi3exX+Arpnn6jsNu3Q6R0Etu55vKDr0gHidXLUlLPdQy6dDAfGv8cQafcRvryjzN5k8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBSm2t6O; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-723f37dd76cso3159051b3a.0;
        Sat, 23 Nov 2024 11:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732390006; x=1732994806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKFqWwSN5qTyHdwloGljW7z+Rtw5u2QrsWqXju4EFjo=;
        b=eBSm2t6O1a0AzHWhWuwPVa7+ug6nYWL2HuiXOarHiuXHShZTBEXKXwb+BNi2CWUj22
         4o3+aNpPX//4kg8V7BTmIPYxbUGPnzLWfSSSgyfF3gK9oQQLGWOQXsAX2GuspzeqPzCu
         eSncT4ly8lG3VOTnWeJqeKeLfqItwaTKULysIGP9h1WASLdLPx5NUcvTlLV5iKVRz3WE
         xc72QnSsmHQM7aalRtLAhY/I2ltckXiOAFLMCBmqqVv1tVKuUGNZUMLCzyKnOfHJsg7q
         m6aBfU0LvkfjvQyMuG7D+QtQ9nU2UMh0K8Xdcop3ET6eCVK7C2cfbPpe7SaEsBYwKkm2
         PnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732390006; x=1732994806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKFqWwSN5qTyHdwloGljW7z+Rtw5u2QrsWqXju4EFjo=;
        b=LmOQE33vAr40w2oDHy8ksMdHKe+zPItVpTBXtkvXmqSd+H5MxdF1BILZEko1nBY6An
         2oQ3y71tRDy8u/02p5TquqDdB1zWWWt2lYmUX3cGMV4NytCNySh9iMFVVqLlkiG6F9K8
         /WppinO5l0Zv0kG7Cr5nyufLSm4KpPIxremH9wOQl0Ti0WYMvjUFr5DHUuBxl78ZfgZ8
         3EDWRe5FyQl43o4X8GXP79tnvEDoQEY1nqgm1wrlRNOod3CY0v5VOZ4Bra950zkAArpW
         XrhYCxcUropqN4/3g+1ECp5jsDiyughYg6JIoWxU+Za/TZ0BGmF1DlrhYu2jQqD+uuw4
         wlXg==
X-Forwarded-Encrypted: i=1; AJvYcCV/buSqaMGYIPZJDzTFicZ6s/MTV9ak5W+0o0KCHhxtnNuYpr98XCCgMeA9RVnOmv+J4jgkptulKf32@vger.kernel.org, AJvYcCX49Wtj/KYRrIHQqaOx34T6D5QzM0OBUqSyB1GEjZDPgPqNG2N+WS6VMBdciQo4a7989131gh5YZVFhdQ==@vger.kernel.org, AJvYcCXCkgnf652KvDxIKKQHlJslXp+5KCUdjz3+h57hvbPZ8A5JD5M0RbXot3G9KAFL6vFL/WDHabVfIWCRN4IjhEAd@vger.kernel.org, AJvYcCXKu0shkV3QO59aBFRDrY6rxVbYb0bbSmLjeXUBiLw7NK/LlrpUllvNRLa2lalsBdnwv88vG3cxOatVSavs@vger.kernel.org
X-Gm-Message-State: AOJu0Yws56yQtX+tihlgX1+8crGqj4C0TSNrY0tr+jyFJmIjiqWDPJLc
	qxCMTKAXGdFMCUoJDZA0lk9pg81BanR+CmZOGGYJ/UNMZxvNV+qy
X-Gm-Gg: ASbGncu4xvb0QbaNm8WJx4xoyT81nxS4Xc1wb0/TFSgXyy2h35LR+rkLB8GuS7k2t0q
	anBa0Ch5enbL6MCdZ+hGC2s0c/5BKhb7Au/SeAqfdsqTsKaygVXmioSwMScUCx+WK+Cp1dyEPgC
	h/kKsJxZ9bl5GGkuQ35wkPqfXUwKBTX/bVaaSclB/ptSvxXdnMZDZAC46zsLDWDVFXxhBaaeZ/i
	AnAME9xjesn/Ua6EY3NzTlFKSDjJjJC4qJ6ZEolIDqTSuCIriGWo8eR9H2TVGoEIrTZdmZhn5Q=
X-Google-Smtp-Source: AGHT+IHqe/epLud/t0Z0A5XPkXsAE+8YfobMQ1Kd10MhS+puwhDCWnm4VHQZFS7J5N/OC/pbwoUcwA==
X-Received: by 2002:a05:6a21:33a2:b0:1db:de9a:bb01 with SMTP id adf61e73a8af0-1e09e5d90femr12799969637.40.1732390006051;
        Sat, 23 Nov 2024 11:26:46 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([45.64.12.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc225e45sm3689734a12.42.2024.11.23.11.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 11:26:45 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: andreas@kemnade.info
Cc: Laurent.pinchart@ideasonboard.com,
	aaro.koskinen@iki.fi,
	airlied@gmail.com,
	bavishimithil@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	khilman@baylibre.com,
	krzk+dt@kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	quic_jesszhan@quicinc.com,
	rfoss@kernel.org,
	robh@kernel.org,
	rogerq@kernel.org,
	simona@ffwll.ch,
	thierry.reding@gmail.com,
	tony@atomide.com,
	tzimmermann@suse.de
Subject: Re: [PATCH v3 10/10] ARM: dts: ti: omap: samsung-espresso10: Add initial support for Galaxy Tab 2 10.1
Date: Sat, 23 Nov 2024 19:26:33 +0000
Message-ID: <20241123192633.2049-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241123200202.684d8bc5@akair>
References: <20241123200202.684d8bc5@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> well, look at the schematics and see how it is wired ;-)

Schematic mentions vddtx, vdda, vdd and vbus, so unsure about that.
VDDTX is the one with 2.8V, VDD and VBUS are at 1.8V and VDDA is grounded,
it just gets the input from GDNA from the same touch sensor.

> As the vendor kernel seem to
> set i2c to gpio mode, so probably because the vio-supply is powered
> down according to the board file you posted.
> So it might be vio-supply only or vio and vdd-supply combined.
> In any case document what you have seen in the vendor kernel.

https://github.com/Unlegacy-Android/android_kernel_ti_omap4/blob/3.4/common/arch/arm/mach-omap2/board-espresso-input.c
This just makes it more confusing. Very confused on what is what now xD.
reg_touch_ldo_en is 2.8V which goes to VDDTX, it is gpmc_nwp.gpio_54 - TSP_LDO_ON
ldo6 is 1.8V presumably ldo6 (VAP_IO_1.8V) which goes to VDD, VBUS.

> basically says that standard touchscreen properties are accepted below
> rmi4-f11. 

But we do not use any of those properties. If you're talking about the
touchscreen-size-x/y, even in the examples those are out of rmi4-f11, in
the parent node.

Best Regards,
Mithil

