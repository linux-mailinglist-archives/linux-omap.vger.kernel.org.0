Return-Path: <linux-omap+bounces-3278-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9447BA2BE74
	for <lists+linux-omap@lfdr.de>; Fri,  7 Feb 2025 09:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26FA1169E37
	for <lists+linux-omap@lfdr.de>; Fri,  7 Feb 2025 08:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33ABA1B3957;
	Fri,  7 Feb 2025 08:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JxyHj+mR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1A81AE877
	for <linux-omap@vger.kernel.org>; Fri,  7 Feb 2025 08:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918450; cv=none; b=ARiXDE311WxOxedXo66A6W7CofUbEU27MvFrt1tR2oQnN1sZsZYWA9dcvdG/pODCemJ5ACmfY4lL6O+6/dyJ/I1G2NnoV1ORTVy/NOOCVSIshTM8zvtSk735LUdcJefZ99WiX+oolTKI0j3N5pUVD4yj4hwDEaZfj6CGVPgptUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918450; c=relaxed/simple;
	bh=9YpRgDpXU7I7owpZmRmyzaYa/6nDtjaGWuZ2d3DUa7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fa1gwr6KJf8V5w1leeylfVAkF702izPEJ2rNTSI5DW/TiNxeXzCdAY1QNJLkvE4FiQsjdA/1UMxL27yMe36CTcoUDCeN+Oh1ySiRAZiIO+YE5Z9RNdIo1rhHbrvvn/ljpK5qph5Px9Or9I5ecmiA9u/vQEGXNvfv+umFPQvqaRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JxyHj+mR; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3072f8dc069so18758091fa.3
        for <linux-omap@vger.kernel.org>; Fri, 07 Feb 2025 00:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738918447; x=1739523247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YpRgDpXU7I7owpZmRmyzaYa/6nDtjaGWuZ2d3DUa7Q=;
        b=JxyHj+mRgzITlPG8rh+s9KeYHq9Kqq43I7VRIYkhrAm27BkxHjM1HgR6SWP11tP/nx
         cjbu3Hz05x+FYTFMx5w6YUJ+W+rO1IP8FFil86UYwBQ+B00gAh1nYkNVItEzwtBG2FcA
         NYyb+g9srRfxRkjkmhPjLFDTnAe1fpcI602FT5EdUafcv6IKLd2PxUgodqgP6i9ziP7w
         jSUcilml/Zm4wTl368lti0134QsT6uOL53laFt3Mhim9UT3gxx1aN7ymc58mht7zqSCW
         vQqQX9HOLdIsuAblTAERx405xttawK6cXLPUaku+w/karePkV3uc+69iMFK6YuK+hPFu
         TOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738918447; x=1739523247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YpRgDpXU7I7owpZmRmyzaYa/6nDtjaGWuZ2d3DUa7Q=;
        b=MOWvZiaWhivRpx8YS6mz3eudpHNvtB0U/oMogPeKDx6MvV8AlGtpW09bfXaWQ2TOOQ
         ACC759eumoDxOzdIPLYauMdreY4/zsu5dmLwNU9elvoIAPDUQOv8MzZz6c44RW1xFrzk
         8bbeFK+P6enJurlBavW2tFm3AphG40BHJUswBeNBgAVimfEufrekIQRnlAeLRUZY6LX9
         2mnCzPKqb/Lk+XEFzUkP+4The6rTd/p+ftBVfAHFJH+w/Ql9V3I61oVxhC34kdDtVqbK
         4R/X6ofCtG1HSJWoIXLvYX66bFhy6w9R0Pg17m7NPHDlQYZ9lfVXFNPf+uUbMOOF9EbC
         YCgw==
X-Forwarded-Encrypted: i=1; AJvYcCX2PkX+j06vCseLQvLvA79LarW3m/a+c/NKcmZQ/btjDlCNdRPLTGQUpTvpN3Ox86IRz2I7/75VE0i5@vger.kernel.org
X-Gm-Message-State: AOJu0YzqZ5doXUatFvd9s7SsEDHnKJrZCz2wVY+cxqsUdqfgTE3FF9MU
	1Br/c+3DyQcq2ZAo5kmdi03ChQiDWnTXujZjMatZZliToR8tDrKULXZ1kDiESxI2xBbj6BumddA
	vZTH1VwiIh+yXN4Tq+ppsty+3ckal3c1liwEbdw==
X-Gm-Gg: ASbGncs3HQUAMCN2k1Cd0xevXEjw8Xz1QF/U+rt+U6jvFqLfbGGIEvCsepaAkRJzEqf
	fzZWELgNHCPZ5VkGMPmhDCzemxiWIUzK8JaubxXIvuu8UwDwGzSf4b9W5yOi9sSIzOQ/ANiH/EN
	djYckJLh+oFIa5uT+IJ/P/sWcEMaY=
X-Google-Smtp-Source: AGHT+IFsHFJNNKLdEXxQ9RmJCfueArNgIRv8RA8F15dLwBa+jex6lO4HgAmkMuAZ7uzNIjHQrLjlpHUd8vXUHrS8TPM=
X-Received: by 2002:a2e:a58d:0:b0:300:33b1:f0cb with SMTP id
 38308e7fff4ca-307e57fd423mr7386291fa.13.1738918447302; Fri, 07 Feb 2025
 00:54:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113225530.124213-1-s-ramamoorthy@ti.com>
In-Reply-To: <20250113225530.124213-1-s-ramamoorthy@ti.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 09:53:56 +0100
X-Gm-Features: AWEUYZmOl7wUQPy_ROOuSzKSygvKItMb-rBgZEqVwt35XGP1BYQLd0FbfBe00Ew
Message-ID: <CAMRc=Meqjy+cqfueM_dQE8uP32zS0ib41qE+OPPWFkhoVTGc2w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add TI TPS65215 PMIC GPIO Support
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linus.walleij@linaro.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com, 
	christophe.jaillet@wanadoo.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 11:55=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@t=
i.com> wrote:
>
> TPS65215 is a Power Management Integrated Circuit (PMIC) that has
> significant register map overlap with TPS65219. The series introduces
> TPS65215 and restructures the existing driver to support multiple devices=
.
>
> This follow-up series is dependent on:
> Commit f84464ec8190 ("regulator: dt-bindings: Add TI TPS65215 PMIC bindin=
gs")
> Commit 8206c20f4c82 ("mfd: tps65215: Add support for TI TPS65215 PMIC")
> Commit 0e0b7f00c111 ("mfd: tps65215: Remove regmap_read check")
>

Did these go into v6.14?

Bart

