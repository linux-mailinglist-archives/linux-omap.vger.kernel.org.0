Return-Path: <linux-omap+bounces-4902-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD3BC5135F
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 09:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 10BA14F0676
	for <lists+linux-omap@lfdr.de>; Wed, 12 Nov 2025 08:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2C52FF643;
	Wed, 12 Nov 2025 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AYISAMQH"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182C92FD675
	for <linux-omap@vger.kernel.org>; Wed, 12 Nov 2025 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937423; cv=none; b=QWf8e6zvm1JHf9syxFE/xD7Zo/mZCP7KeYe0DzIcifbMqNSHWg0pT2OBx0MT30sJjTdFtdTytAkINS08ijxOgSDmHPNT59OtdM8QwX14Aus17SZHg/Z4YwVNhJvor2OEKGurZMFVWrfsIZ7pEWWuQvFzpDJ1TBbyE0+/YEql2w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937423; c=relaxed/simple;
	bh=cv14ieFpUbwndSxAy7avkwQ2XyYjwC36K/PyUY+um5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwkx1oosu2tKAEsVuA9buxB4EQzpvW0ADRqr+HWxM7lgFwlmn0WpYlBHCdz0JsRk3z7la+IVacj+oBNcic1Prj7BsNzKFyj1Phm/eOm0uGf0BvyjwES03vYKDlv4g7tuksWQbgUc3SSmiyp+G2D5JAPFZL1AJjh8KJd7e6i7mYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AYISAMQH; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a5bc6b491so3882591fa.0
        for <linux-omap@vger.kernel.org>; Wed, 12 Nov 2025 00:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762937419; x=1763542219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cv14ieFpUbwndSxAy7avkwQ2XyYjwC36K/PyUY+um5w=;
        b=AYISAMQHJptwYpNDmLTvQ0d12KHT9puLlFVUSD27jqSrfbp9Jk18LZCnIlbC5y2iID
         u1fq2X7O3iIp+xkexEvNAsJrfnW0RI59PnJHiLbvbvgdaEClUTkbL7dgWCMJtJDlJeta
         1JR12Ff5eBMHpStf2uoO068j8EorFjm8uMIVeTbrx/FiAl1m3KJ5HykO/UrmS3y4wsmv
         vAftNW19IfLeURBrs+4SkNEVfIUPR1JdDRNYWmrBvyGK/zK10ySdybz34CxRGNaZsD3k
         2JTHkjDiuWW6n3uoYK5sZLNFfRyxeUa1tVCfHVmnc52FdaMt1TL3nE7PEUN80+UrBLs4
         xuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937419; x=1763542219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cv14ieFpUbwndSxAy7avkwQ2XyYjwC36K/PyUY+um5w=;
        b=jKRTGD/owl1oKbxOs0h1GAodAWNqRqTNGDWTeb+zYUSmQwebJKIxmuE3t2cPBc7/dz
         6I4o7SKmwDPDmfFTZrLnVabQVSuyNRP/qLaDd/CWcPOzt94zfX9j56qdpPdThf7FLQzd
         W9iRvyJOaP13KPlqCNPBMtQD4TqmBcfkRBbz8ud0AswvxPKUsU5714adBmdQaxZH5m/v
         cJpCsCIt2LOJz16VjxulDh39sCK75BM9tYgJSdk09rJE+d6zww/gsnLThvdc41Siwq5h
         2rSo7V8VppDkmW9cicCkW9u4exl5IhO55TaSa7lfz4QGxdfj7NeHvsXZh4plMUdIyq+g
         SKPw==
X-Forwarded-Encrypted: i=1; AJvYcCUq8Up4TxNWGiGGZvRSAzwSb+i4jIb+Msbp8FI1Vhjd7SzB6Vp1M9jy4qXjbqOT85UEYAr8ff97TdBt@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl2x3ZGe7emNWdGWFGMN8bQWJhYumRx761fvLGZ2eyrmELzhwq
	mcmpiw29/A/SJ68cTGag+LbvvxDLJdOAV7uSJeUh4b3i5OTml28jeSU1DcLsFsq3celdr7CKuNj
	Ln/ZD+PnNpCofozZJDQFGTvIq1QBw4gm6fbw2fHZDQw==
X-Gm-Gg: ASbGncs5t+WOx4LJ+Q1VrXoZ/vzbVI8/wl2u+JOqdjI61SJP9PaIg2fSWDWjNjDyPrX
	LEwDTNFXLmWDldoIWGFF4Vn+zXoOyavdDSRPIVqdpSm+Foa3Z84pgSAusV3ly1BfvjZ9R6K80U0
	1aYFU0Iu+xQY0pD4N37Wu6J6hhN1NGVLmIzwP41qvWynZPyHkL0RGJLY2C0n0fyOlk+OLFrGRSN
	nrc0E5Nbpf8k+mkOAaa+ALcTyt3+cTsu48uzU42bBCwUWIV7yvFqaPAd6xPWhMqNewvl3EGhspe
	v2m1826nSxg9zcO3kQ==
X-Google-Smtp-Source: AGHT+IEHNK5povoEOlSKstlSmdaONyaokIQjzvKfkQZcWTAT6dqm/dGcMdLDdwfQXgcunxTTDe/Pm+/naHGGXjffp3E=
X-Received: by 2002:a05:6512:10c2:b0:594:35d5:f837 with SMTP id
 2adb3069b0e04-59576df6c92mr609466e87.19.1762937419287; Wed, 12 Nov 2025
 00:50:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107141907.229119-1-marco.crivellari@suse.com> <CAPDyKFqpiWuJs3fZkATnfPejmqL=Ei4x1U9QbuaykuZxca9f4Q@mail.gmail.com>
In-Reply-To: <CAPDyKFqpiWuJs3fZkATnfPejmqL=Ei4x1U9QbuaykuZxca9f4Q@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 12 Nov 2025 09:50:08 +0100
X-Gm-Features: AWmQ_bnLU4W1RGKwfC6lAOJz6bOKPsLL4ZN-hxDK-KkR_0_v7NSwMnNMX7Q48II
Message-ID: <CAAofZF5WTAZJw5FmtTkB_FGNfee8myVksZGhcMQHj906RGOzYw@mail.gmail.com>
Subject: Re: [PATCH] mmc: omap: add WQ_PERCPU to alloc_workqueue users
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 6:37=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
> [...]
> Applied for next, thanks!

Many thanks!


--=20

Marco Crivellari

L3 Support Engineer, Technology & Product

