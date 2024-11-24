Return-Path: <linux-omap+bounces-2726-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5ED9D6CFA
	for <lists+linux-omap@lfdr.de>; Sun, 24 Nov 2024 08:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3C0E281551
	for <lists+linux-omap@lfdr.de>; Sun, 24 Nov 2024 07:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB5A187550;
	Sun, 24 Nov 2024 07:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nANAZmy7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09072C80;
	Sun, 24 Nov 2024 07:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732434289; cv=none; b=My2yvTp4sIsQxuB0DHzftdVgGD8P1F+yetlrZrXKTPoPJ3yQD78UlqVyPbFzo00OUySh0if6dCHOVKhLhJnp+vwF/+1k7cMWdKy9VBqKq1n6SYZwABtVZtbg/i2uxxSA2ALUbOQ4MaE+jkT9FrSjp3G+WJMFkH/rVWAroXfCUsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732434289; c=relaxed/simple;
	bh=Aq2f37XpxmkvDg9k6RPxNwitNinOPVD09l4HgvPD3Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwQ1mTyRV7MFbzmxve0S53XRDhdb1qLVSD1yBn1Wog/WXZARX9lCv7qj7CJbwvTCow0Ier9lx4XIthVy26uFJ7byOaavpWIvviKdcko4HcMOrl853gMe9NMT0AcRnIPkVQ1mYxxhdKgLTwLEKRAasD5AHSVKxLBsh3l114PKKLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nANAZmy7; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ea2bf25dc8so2932918a91.0;
        Sat, 23 Nov 2024 23:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732434287; x=1733039087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq2f37XpxmkvDg9k6RPxNwitNinOPVD09l4HgvPD3Nw=;
        b=nANAZmy7IWQuXYfzxmtXOUE933+Y0uIpL8wISUjA0d6kNxuGol5cDlVhp2uvL1+2Jo
         vk+onx3eSEtdMPJYmflt6uwP3UGeocSDATn/0ZFsHb/qLylsrkZ9wtGDZhZL3IUERWHr
         KO3bY00yz+u4VmMs1WFNEB52GLgL7l1nh4Vr8LWbq2OOw9kgOs7ykLCx0YjP25bMx3Vx
         rcWnMMi0FHVXE4trJrDzYp2fDO8IDVZwURbcczUDEUNPjFL4j1Si5JWTK+0LHzpTHEw0
         YVJOhN5iAd9T40Ny23BHlpe4TuxVsXMSh+HlUhjld9TR7dlHhwN3XbqQ8zoUENS/ndMh
         dFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732434287; x=1733039087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aq2f37XpxmkvDg9k6RPxNwitNinOPVD09l4HgvPD3Nw=;
        b=sueBMLmmSEg5z0mhuaMIykaM1f+W2zXUd7duWTTA4sPU4TCv/TrxgT7VKuLxvtfIKt
         47ciAEXII4/Ubz0zrKtEmoI+h08HAdExcExCA4uInPDohBrSDYXFb3yS2MqY0W0BEL/2
         U4MfRTS+hLboL3nl7afWwJ+RcQl9OB8oeXNkCuPrY/NFN+B+fPyDoXK7i5JkN97ur379
         SAOBTViFaGXrZpKnspPVAH14SNtk1I3pFSjB8Ks/axklcO42cU/mfIlSo1uKH0z4t5ih
         RPBzhfmy+T/gTSFIzxXnjLdOBVHayIVCl+iOLoKIyGgK/OS9Cq3J/jkhhL2qqZNBU/4t
         4K/w==
X-Forwarded-Encrypted: i=1; AJvYcCVD1MC6JhB/+wxMFliW4mujGX0tvilbLk6jTf/C5gPhcx7NPirsrdat7+/WQqNOPjTNshDiYjeelO+HQZeH@vger.kernel.org, AJvYcCVUcGf3Zf4u9uqNYowmpb2ogwOeyYRJszP/crrLy8NkrCbqXM/3Ziy1h2x97E26wsZ0PAaO3lNqQMcLTQ==@vger.kernel.org, AJvYcCVyLcZ9hMc1snFMoCk7V1L5nt4rFJD31DXIvFGB4CIX8CYD7Trkyz1Z7UYTWslyiMOZIOdQlgMdEkqZ@vger.kernel.org, AJvYcCXFfqFTJSc65fbOTRyMeShLVkgT9uZDTqd2spynXQ0IoCou+swv2fb1xiJ+Gz6oeDvBTOD3Vt71eDFcuF2XXIgW@vger.kernel.org
X-Gm-Message-State: AOJu0YwkPrdLSnPrQeoixd1UfgmuBVxcg57jeHK+/Y/bSFzmMdRFdnf4
	8/RqzLVU4OXlZSoARx+0FSinV49np7NcGq9LyLILhuhCq78cTPmW
X-Gm-Gg: ASbGnctfdn3khWomDx30fKk3CC3Jo4B26tTJc0jNNftUdEY/0dXkFcAICpqIYZeDaDQ
	YRTtl6Cl4yW8Li3Nehj/JD42oKuFd6aePgVSAgeBustc17sd4ckNr9vtmFxN1OKo51wmmnImezk
	9RqecgyVLCYI3BQ116wrxtlpAP09Gnys4DWKRf32QKMK9sOLtriUxuTLBEcFt/2mrDE4MtBYfcl
	MDlJz5yiVw7V/a1PdPOBSJ6S5T19FizPoMgaJS3ZMDn7xfgpqJWyXN3HphlahRckqKR+fVkQH4=
X-Google-Smtp-Source: AGHT+IGmkHiMH8U4JrZGmeZGNyxfAdia1O9NuHDN7UBXQpwBwxx7QaDqfGke2FmpU6dpMC+J18Wgmw==
X-Received: by 2002:a17:90b:4e8c:b0:2ea:525e:14a7 with SMTP id 98e67ed59e1d1-2eb0e866014mr11327597a91.29.1732434286850;
        Sat, 23 Nov 2024 23:44:46 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([45.64.12.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead02eca46sm7870925a91.7.2024.11.23.23.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 23:44:46 -0800 (PST)
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
Date: Sun, 24 Nov 2024 07:44:34 +0000
Message-ID: <20241124074434.534-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241123223150.28d4002b@akair>
References: <20241123223150.28d4002b@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> well, I think I2C bus runs at 1.8V, and there is IO_1.8V in the name,
> so vio-supply should be something at 1.8V, so probably ldo6 is
> vio-supply. Maybe add a remark in the comments. But then it might be
> not a good idea to turn that off in suspend. if the other regulator is
> kept on.

But we are not sure if it is the same, also I personally cannot test it
since I own the 7 inch version. Let's remove avdd supply for now and see
if someone with 10 inch version can test it again later. This is better
than putting potentially incorrect information.

> We have also the warning from dtbs_check:
> arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb:
> synaptics-rmi4-i2c@20: Unevaluated properties are not allowed
> ('avdd-supply', 'touchscreen-size-x', 'touchscreen-size-y' were
> unexpected)

Ah, indeed. I missed it, will fix it as you've mentioned.

Best Regards,
Mithil

