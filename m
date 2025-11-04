Return-Path: <linux-omap+bounces-4845-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB73C33565
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 00:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10F82426F5A
	for <lists+linux-omap@lfdr.de>; Tue,  4 Nov 2025 23:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61965346E72;
	Tue,  4 Nov 2025 23:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Nf3h5MV3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467F934676F
	for <linux-omap@vger.kernel.org>; Tue,  4 Nov 2025 23:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762297622; cv=none; b=W89JpSBOykNlDN3nBlyhGj4gj9Y3MSAB4Ek+cYJMw4YuFaX9Mfs4DNDw/1/nEqO9Jlh3wrJCuve8TL0weghJIAkxYQQ7b2uDd+91ixAfAxIsHyLFSD76D+VMzG59bNGI0rninrxJMu9OyyoTmefUXnQUWhwECuZ7QPBzdtIs/EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762297622; c=relaxed/simple;
	bh=CsY4m5s2RMJkD3lvjeOF++mv47u/HIAkSzDbG5YyYFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OqrOwn0NgSjmHGQMh0/4VXm2YZMsfNXQPcYAnN3gZMR3OGoi8ycdxyvpTih1sTzTVYSyXBAuHzD6qQKapBiktgDSctQgIlIO4bzpp2LwwfRueLqNJncrmvXdtJ6vVZ/w7sVNWre9e/ksTN9y6WEoRk1fpjaOCiDozTlOF/8dv3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Nf3h5MV3; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7a226a0798cso5824188b3a.2
        for <linux-omap@vger.kernel.org>; Tue, 04 Nov 2025 15:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297619; x=1762902419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7rOk2SljDe8T4aO8i0PRNva7QDAcRd0Lww0kxlgSZQ=;
        b=Nf3h5MV3kq0+e7RI2TRSY/yX09WXLgN5TtiF3py68fUPDEfoNlXrgqlNGhhPl0Mr1Y
         1kZv/1dvM8+f6I8/yjDAgpDLJdNqO+hP0OJ+OazFUnStjli5WLaQOyaStql/UIhwvLhN
         k/OdXiVBOJRIuxqFr/SD8iepocR4ZlHrIT9o6c3JJ3VT7iYnoMWDfcz7/pDSM1Lnm3rN
         9/0BoBzb3wh74v7q1HV0OokX80JZzSijACcrBU0o3/0D0H1qhufR3ErOQ4afJcH2sMoZ
         vCHsJM1vsBMLuQP/dPF3CpvYrSKwHVtjh0a1tAL5PiqEA14EZYrE+JiZUD+lSmqEzzuQ
         aOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297619; x=1762902419;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7rOk2SljDe8T4aO8i0PRNva7QDAcRd0Lww0kxlgSZQ=;
        b=qgpx6Gx1XAwuNNq1r13hDZQdXIH90geb29OuuHjg4t3aekNtSkZkrTtfsXQl0S0O+n
         RaH2KMYWRNBfUyDrxd0tk36G5+OiwRUU3sWUhkiOMFkARRSOsFG39aqAeNFbCac9M6on
         uvvowq62+Nx0U4yHzuq1GrStRweSDPldmzhOnb6BUFpBx9dNWfrX2Igph1Ve7BneC+U2
         ehNG4DDBNV8VGCBxI6t6LzI+BNSSr7U78LDo07iQbAnvChPlgoUSte3ZIcvRCSeUXyro
         ns5iXZh8MBM5MlGXpH/GZN7ADC1R5riWZ5o2b1zrsIKC4Zant+J8BAJTgwgekkZjA/gV
         YScg==
X-Forwarded-Encrypted: i=1; AJvYcCWh8SCktPS52lveI7lzB20xVxm8ab0IS0Y4sBITneJNc4FlofubDykBqcVfhSCSdPbYdGBvAWu0o2+z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6RBkwiIJ+MbE+jxIMCSitlbj6jQOdwxW77LOSBR5mxcJfi+NE
	c+V4tVnkJmr92QW0+FUvrTKv30gR4lICtBVWlk/katQQHfklGa2/p6gxOtS89wEx43k=
X-Gm-Gg: ASbGncs9cg/FZyw+/eUZgnaxZU3vFAvNUUsL7oLaU/XbtpWbCHT71oUN1slCOTyyh5k
	GXuA/czEoQOoMWf+zM2b/m8gBZlPJUH4/CQoGmtKm+GLu8FPP9pnFQr5CP2RCHsJxhfPWM54TBr
	0/QIJThQiNt4BPBX0ma2hpiLQ3OMy5BVJTtjC3mUXeR6uCSmisMa87D+VJGzfBGq584CaJyuznh
	OrEMyTXo91TPVKzBaBPhD07iQ/OSuTaoPXHSHRmgSFhZOOq7C/q+KCM4A4mqdAd+GF1gaQDhvNk
	v0c+wTwOAEHiViFSPkhpWAxsp1/XAcHh1H8f9NC/VGSntDfNpZ6glB/7Ga1XghJfziP7+E6G2vL
	kEChzpvqDorj1qxMX66sR4DUtvFr/wqjnZj4GSgxub4PKLyCOP5fJiVofwfAkzZggNke4DEHvjA
	==
X-Google-Smtp-Source: AGHT+IGLYp80GBLpwoYMtkxAs/l4LiwUD9QsWZrdQvRIeBfncu8inTEVtgBSRIphFP4oV2r+3SM7DQ==
X-Received: by 2002:a05:6a00:2d92:b0:7a1:68b2:5341 with SMTP id d2e1a72fcca58-7ae1d250dfemr1114563b3a.11.1762297619593;
        Tue, 04 Nov 2025 15:06:59 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd5774c21sm4156649b3a.43.2025.11.04.15.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:06:59 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: andreas@kemnade.info, Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: lee@kernel.org, krzk+dt@kernel.org, tony@atomide.com, robh@kernel.org, 
 conor+dt@kernel.org, ukleinek@kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <20250914192516.164629-1-jihed.chaibi.dev@gmail.com>
References: <20250914192516.164629-1-jihed.chaibi.dev@gmail.com>
Subject: Re: (subset) [PATCH v8 0/3] dt-bindings: mfd: twl: Consolidate and
 fix TI TWL family bindings
Message-Id: <176229761865.2840692.9613824843684430886.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:06:58 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Sun, 14 Sep 2025 21:25:13 +0200, Jihed Chaibi wrote:
> Following extensive maintainer feedback, this patch implements the
> "define then disable" pattern. All possible child nodes are now defined
> at the top level. Conditional if/then blocks are used to explicitly
> disallow sub-modules that are not present on specific chip variants.
> 
> This refactoring also moves pre-existing sub-node definitions
> (e.g. madc, pwrbutton, gpadc, etc.) out of the conditional blocks
> to the top level, following the new pattern.
> 
> [...]

Applied, thanks!

[2/3] ARM: dts: omap3: beagle-xm: Correct obsolete TWL4030 power compatible
      commit: f7f3bc18300a230e0f1bfb17fc8889435c1e47f5
[3/3] ARM: dts: omap3: n900: Correct obsolete TWL4030 power compatible
      commit: 3862123e9b56663c7a3e4a308e6e65bffe44f646

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


