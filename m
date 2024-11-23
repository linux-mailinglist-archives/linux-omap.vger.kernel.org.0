Return-Path: <linux-omap+bounces-2720-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB929D6AA8
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 18:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42E02161970
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 17:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273AF146588;
	Sat, 23 Nov 2024 17:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPNvZ1i2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707B817C2;
	Sat, 23 Nov 2024 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732384392; cv=none; b=IaVYB2fs8yMKUQZTtso04Sl8NRySAPfmVt/SSuF3QaveZZfg5uVgJd+K1nuBcg2tP0k2r4VzJWHAfnhOSyYWh15945fHlIZlWfDjfYsjJqybHUmUa+i9ZRIoxhohNDcIVb2hEZ0tGDdE4tK4/710nLD7RFiR9vtpmYYQcPlvqMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732384392; c=relaxed/simple;
	bh=jCOcj1QFVge2e2sjAAUp5yF0+g+gTAyC86ZwLrjygZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQeRM0vsRpTLvEzlWyML8nIYHf9eJf06q89dI4cFwTn/ZTAeAj379gjZeUvGKFb4sy2ebskhqBfv6HmqWshg/IzD4MuRO4Mr7kf7UIjkfpUIvJxsUu5W/mxsjKRvnBKT2s2StkW+qF/OLQfV0fnrBfxDgoRMtbsnvP8HavpADxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPNvZ1i2; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-724fee568aaso167208b3a.1;
        Sat, 23 Nov 2024 09:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732384390; x=1732989190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MChWc41P4OMqWVju6vAFErZ1LM1yUreLUBjhHItchBk=;
        b=UPNvZ1i2H/deOdk465kyaZLwTI7pCJzfkZODrX2QSgEvacOFbsOLP/v9ezTZNTHOka
         7EiWBmQhHzeshOITS3C8xCpGx85TGab5gXh1nCeOzMlYiT78dDps4tIyPFJrdY06VcaI
         fZnWzahvfsX0B3BRS+LPvuOOShWqJCiEcfXct4LbVyjfpT19nJOZJWeFKaxyCZ6j9hWZ
         JpPhXKEi89CgrZjyTQbzCYV5jHhglbZmN+8BhLrJ+R3F58tMV4vocwysQWtsgouiL/kd
         bxqvMV8cvuQ8kWcSq3xuC1rEUWfYM43SEVy0TOD9xOcd5ZVQbtPwI/JEAcwYtDPHERIh
         911A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732384390; x=1732989190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MChWc41P4OMqWVju6vAFErZ1LM1yUreLUBjhHItchBk=;
        b=cSzbo3TiogdDuY4eQqPV144NOkhR8pSiwTdWLi0OImWjXiZ40PsrWiDNEWZJhaMl8z
         5V68xlgBtCL4ZCFXPStU3irPPxDKQBsQJ/E1hUSG+4O2vUgdpmBwBDX/dkFU10GM9ukn
         xId7yVVtLmZKBvUvC3EfE8KW+2tH3XLxcsX6ea/BmIc5EXrSA2tDhHcPeGBNn97qA4Qw
         V7BK6zb2vb7wbhDQ5MfjLFRVTG1OAI7GSCy7LP4pdP31y0vtOGpl2u6Q66OIKTnv3fVi
         1SqUMb6q1QisTTI0lZi5D1iLyEa2doddR9+jtIptNNcMoZoB+CWyayOaPntx16yRiDjm
         DbzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb10tjwWgJnozLxk4jQvxpnlXNEuD5dQ3GVGvOZpDFQ7HCKPqWDZdJHt1gJ+S1WHaRTyXD11q8vVMl1g==@vger.kernel.org, AJvYcCWAN6V7YrguorfdIM9OqNMKgDQCXsmaLsqVdGvKnBPpumjzrSLmmyErlX2+cNjw4Ii0srIwcLmMTbEu@vger.kernel.org, AJvYcCWR2D1XhapMQPrgS29Rw+WSoUCbP8X4gPkXUBTTsQY5fuBvzuhFF7sL0X0z1H+VPVeEZjSlyGx71yCUqgLE1Gqt@vger.kernel.org, AJvYcCWjqJcX9ZbyK2bn69/V8iMFDc29PLmGfy9PQS6Wv30n0ARfcIj/iAq0l6pZ04YX4Y6Kj7T5f3zaEvtbR+sj@vger.kernel.org
X-Gm-Message-State: AOJu0YyypCbEGfcrMa4E+CCaqMDPXWxz9p1J8gzFdmj6m0/I3wASVgD8
	ydKKqnaqr9PnXvLQmJZCH6iKEoFLsAGk78VEW5QwaoiDpFoDiFN/
X-Gm-Gg: ASbGncs0SzXNmqtGf+Dr2qgoMQMd4/TvtfSCtBx8ipK+1XX2ezZFAwmfA+DU7ZO+0XG
	JLrcFchJTdGWWRjWhkbn3hfkG0EHpqTmGWwcK1F4EYRmtR6ue/pgvuZMhBWvyeGFWFEzcqYLyhm
	cWP3pJ1OWolnluIVUPb8tEBPeqU3kjfliz3O4lKR0xZM9D7f9YeiOP1qbwJTwyhGQAgrJmIEXyK
	4IgsVGh78tQg4SwTKg7zdcH/g1fsAJu0zYPaadvqjQQz5xkhbplX+Un6I0YWnZ5KlpxhrshAbg=
X-Google-Smtp-Source: AGHT+IGDVRgdju70YKS9dKHuXvmqMGTwpB+LfLzrIv8QlUq+0rniiuKlMntRfxmT7VPHsEtMjf7NKw==
X-Received: by 2002:a17:902:f68d:b0:20c:ce9c:bbd8 with SMTP id d9443c01a7336-2129f55d212mr79559515ad.25.1732384390542;
        Sat, 23 Nov 2024 09:53:10 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([45.64.12.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba5920sm35420045ad.107.2024.11.23.09.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 09:53:09 -0800 (PST)
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
Date: Sat, 23 Nov 2024 17:52:58 +0000
Message-ID: <20241123175259.775-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112114818.1eb238e9@akair>
References: <20241112114818.1eb238e9@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > +&i2c3 {
> > +	touchscreen: synaptics-rmi4-i2c@20 {
>
> touchscreen@20
Fixed, generic node names right!

> > +		avdd-supply = <&reg_touch_ldo_en>;
> not known in schema
I cannot seem to find the "vio-supply" shown in the bindings. There is
only mention of avdd-supply and vdd-supply. I am not sure if avdd and
vio are equivalent, hence the confusion.
What should be the solution here?

> Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml:
> horizontal resolution of touchscreen (maximum x coordinate reported + 1)

> So this touchscreen reports max 1278?

Fixed it as well, 1280 and 800 respectively.
https://github.com/Unlegacy-Android/android_kernel_ti_omap4/blob/3.4/common/arch/arm/mach-omap2/board-espresso-input.c#L264

> And these things belong below rm4-f11 according to
> Documentation/devicetree/bindings/input/syna,rmi4.yaml

I did not quite understand what you mean by this. I checked the bindings 
and a few examples, there is nothing "below" rmi4-f11.

Best Regards,
Mithil

