Return-Path: <linux-omap+bounces-2719-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1749D6AA1
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 18:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4881AB213DD
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 17:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47B914EC47;
	Sat, 23 Nov 2024 17:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBiIVaqU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8131862A;
	Sat, 23 Nov 2024 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732383870; cv=none; b=ivan9ybXh3xWqXX6J2PvPUV0KgQ9mcHvve6Zvc9A+GJllS5rgiKPrtvmOQhVgXyG2gjcatd7zWspoNenF0KBICrvEQ+o7c6AkuMd6Eq6UTq0TDPocBON8i67znIz10rv59QdnPG5Rsopn18KO7YDOjk0TRGu6mWoI0jxAqCr5Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732383870; c=relaxed/simple;
	bh=Ei5aEIQ2VBjelOrvrfMxvLiVXuUpN0H7zkAP2TFMKJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OS273OxDyFDpKAuIsXGCZMmAJeHdzUcX5wZcjEAJVX3FsLlgiMNH+qKNfC0MfhJZZkxtVfTyQyK6dI95r00pP+6e4zM5tmWtTd8O8Ur2J3xh+fnyQiEprOS0mkC9g0npnmtzKG99xjZTERsx95SBC2/ewDIo7Mi1p7jqfTHCj7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBiIVaqU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2129fd7b1a5so17206245ad.1;
        Sat, 23 Nov 2024 09:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732383867; x=1732988667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Taj+3YSfAKDsLQncrgYkDoFlJMoLmNKBtRtkmtpeCa8=;
        b=ZBiIVaqUNJyvs92rKJfnL7UKhBbHtJoIVYd0fsQBTirsm1Zb53FF8cHlciLjuYpqc6
         mkSJkRywdTLZ2fA+hzm6tx0RmSJwcdoC7FwRTRuNximWUqTuOZTF5bKKLt5G00tb7OAc
         SbsolBrhbCrhrkqjxnhGTKKyggd6f2we62LdGG2w/fv3cLYBKRvdHk5OASZlIBZFoP85
         DU3RUBbI6fkeWtAa7R8qRdGjvyHipq0pGET5nwhC7J+L6mCYI3IZenB0C/enu2h53SJF
         2/qtR5NFovxBPcHNU0TdM+mpgAT4pug2/DRMVxLhW+pavISpsm/gnrsgmU8e1fbpZimP
         Ro+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732383867; x=1732988667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Taj+3YSfAKDsLQncrgYkDoFlJMoLmNKBtRtkmtpeCa8=;
        b=NuW8r1a1Lmo+e1bVWUHTvUtF2HUtwpdMVTOl4hI/Bcm0h6Zt/YQJMzBQK5D0mW5VgO
         iFe/4hJtUwW6VolYQhhrH2yy5puH1qAS1G1fTIlt+L+PyN/jCNginuYjIRRIVYkq3yeQ
         nyXfDi77aXtSbCMN50+mJsjSQfZqmjOHkqY/zrxfg7Vdva1rNryLfg9ojGWcdhoHrrqR
         gdkqkFtkhsK/uF7rP8s59TNhrb0L0r53fxQM15nOluzrGcVzLBgRrtGDmtABPj0gXn76
         6VWksllxnCeIwwIUqCOCfcL0ITyKG2hDukw0a9q63/uXVKTefnG1LZU8xpdmSh65njmL
         LnmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFQrevGeFGc/B2ACOrn1iHztO4vaQs5UcyjEJbNO8qtKirQSEcnvRhRGxFIfTHQHXEb/izpD/3j7cI4jxz@vger.kernel.org, AJvYcCVc9eQI6vIM649BjMClTxNifQ+X/BI0T+qXxojqm+OF+79Gf/Ur3LHJb89hOx7yUMImVHYgNSefD5vmlg==@vger.kernel.org, AJvYcCW00n4SgPUsURrNmyCTfA1gMYTxmYSKgo7zgK/z5TyyxdRBkYCVFHbbDaUx72gt2KAJBrLWRSf+TgXS@vger.kernel.org, AJvYcCXvUuQoYrw7jmjFNWf4TyrRAku/h8FefjWtzdUAp5HIDCTKkU6VZ4ev5932RCrbs6lwS+amaD7uvknz/mlqy4M2@vger.kernel.org
X-Gm-Message-State: AOJu0YyOYPIrtL74f7ocpZipAAT+Ct/cvzTipLuitJrOsRfsEBGFmHqw
	2HRUTJJcoBdMhUazQzfwGHV+pnDDeDMkds0in7TlbDkLQdWqM2dk
X-Gm-Gg: ASbGncsmr9BfzFnRdeZ/MH/4Sw2+o4k50fu1Uy6C+j2zhV6jfKLNZOukdRCKf1w0dJO
	nrL/rJPtmYh/PlsC8ORyJJXw08R7cH1rDJNi85CYJJpBQc63pUnxIY8DJhXPZZwCxtnN589AQ6s
	2qiEOk8y7JX3nZ+Jgbl2b0KSRymn0YkFg42l9sclpCX4Ihv7xGnh20G15hkR17NFE/IHb9d5mjQ
	WjR6I6wV0+THNEB4Uk2/SXQiEAru93rCzwzX/6sv/iGaIsuY2IhFshbyXM6HtYmQ6ukv/j9DjU=
X-Google-Smtp-Source: AGHT+IFEV5sx5M3llOMv5oeDGg6jrj5DSo4Cp/i06uwAuBbD/AfbChJ11DKh4isN2KMwLs0D/5WqjA==
X-Received: by 2002:a17:902:f54a:b0:20b:951f:6dff with SMTP id d9443c01a7336-2129f1aa923mr117259275ad.0.1732383866948;
        Sat, 23 Nov 2024 09:44:26 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([45.64.12.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba6aa3sm35213735ad.101.2024.11.23.09.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 09:44:24 -0800 (PST)
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
Subject: Re: Re: [PATCH v3 08/10] ARM: dts: ti: omap: samsung-espresso7: Add initial support for Galaxy Tab 2 7.0
Date: Sat, 23 Nov 2024 17:44:14 +0000
Message-ID: <20241123174414.721-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112120020.7f9e0680@akair>
References: <20241112120020.7f9e0680@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > +&i2c3 {
> > +	touchscreen@48 {
> > +		compatible = "melfas,mms136";
> > +		reg = <0x48>;
> > +		interrupt-parent = <&gpio2>;
> > +		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
> > +		touchscreen-size-x = <1023>;
>
> Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml:
> horizontal resolution of touchscreen (maximum x coordinate reported + 1)
>
> So this touchscreen reports max 1022?
>
> > +		touchscreen-size-y = <599>;
>
> same question.

My apologies, it should be 1023+1 (1024) and 599+1(600) respectively.
Will fix it in the next revision.

https://github.com/Unlegacy-Android/android_kernel_ti_omap4/blob/3.4/common/arch/arm/mach-omap2/board-espresso-input.c#L145

Best Regards,
Mithil

