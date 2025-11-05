Return-Path: <linux-omap+bounces-4858-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B388DC3823E
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 23:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A8A34E4D95
	for <lists+linux-omap@lfdr.de>; Wed,  5 Nov 2025 22:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1282EDD78;
	Wed,  5 Nov 2025 22:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mauupxhK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1952ECD2E
	for <linux-omap@vger.kernel.org>; Wed,  5 Nov 2025 22:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762380410; cv=none; b=XIBvcnzCAIDyzo6Bkek9CfboD9b2cC6Eo8R85TWR+4ivqEtdDawGfksnp9gi7amrA4rNuopwA8ZxaXDqB7JozwMcljRIEeAbiYqO/wdNTamf+kJJpUXSlAv2mYX9RDtpVqogQXQ4ae9N5tIX570yoU63e1xQI1S23uKWFayYSno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762380410; c=relaxed/simple;
	bh=SHOTNhnSxMeE28Gt8h+QmahNR+MdQ5fncUYSEMPwl2g=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BTf6jsG2IKX1//hnxzwAcdUjUNlxss+stBjY52qxMV+vfcmmPUN/s/5AzLaMyE3fW27FdtdtPB0tDMVgAtHW+NMUS1TIPqw/Ksc3Z7YCz1AcOrYALHbCoDPZyMj/mnDd0sL8oDnVMUfeqnr2OXQfb5xi0Qwmu01K7JzMLo/5EXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mauupxhK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-294df925292so3260085ad.1
        for <linux-omap@vger.kernel.org>; Wed, 05 Nov 2025 14:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762380407; x=1762985207; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iBkyGpcDemQpY2M094SqDLojxus+6NpH3+OHJK4/jHI=;
        b=mauupxhKu2X5nVOip/SHS/ZiJFkwECjYVSkX7/T7o+JoCNk4VZv4dFeiY2Pt9qIZu+
         YbVsAsOpkwhnGK8d/SNImyjrAwrCUNFECKt4cz7cLH4OoT11kW4gVVILvPmd/8Ds7VR0
         cO3fgSfOI8bwIOlREs9CZ8BhiRdPz8HNBFzTIwCo3iAGVA9plrN53UjJRHH5h82pqWz0
         fq+h7bLffacpa/Fid5Fg/+V73CheWbIb/F5MeK5zar21l0UvQtD8LTJsDg+5iZ/3nUTb
         XdrKHZj4OzEEL3je5R5caOy9Z0loBi3BIp9gvgyVET71iA4D44KD5NLTU/1kTh/I+vTk
         8e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762380407; x=1762985207;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iBkyGpcDemQpY2M094SqDLojxus+6NpH3+OHJK4/jHI=;
        b=u2886OZFLzN9C1yLE6OrAR9mbpch39rpSikrfjUoRi2TJv2BQJYIzV5rBdWyyDzTuw
         xibnAruFBCbHPEVUA9x+0xHXV2YxKCEiMmUISGJqPlvSp/yZndmmXzuJewMtDHd5YK8v
         MpolE2Gdb+BtAe4nPDWy094eiN3Vw8IOPyu9tTyQS/cFoRQ+xvd782OK/siApmb1+Z7n
         gdbntIKGFYZ8VPkCtTwg+JTZEmvXx2mX4w1fCilKpWFCUv19TsjIf11Hh/HzMR4TbWTj
         QvlvRtp4XK0uwLI1iIAj98FOIl7QXp6pewmuAEfmvSN3EJwlbVtBLlClPypBdAsyDeEh
         RIOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeI0L7xZ9cxCu9bJ+33HRRfgySiaHQpIGZv32lYr8lcgG/rKZS61+hHR7XG1vYfihPlOlFm1f/sr1H@vger.kernel.org
X-Gm-Message-State: AOJu0YxXzb7Du4se0TKG9zcAYQhIe2eqM6rrldzQljONJ9+uVLzGtxXw
	V7nVjcMAzZsLYGTydIxrfXdMCIFHgFKJN+5XwPLV56GVolWhX3DGf5irLOMpLBuOFRc=
X-Gm-Gg: ASbGncuJwJHD0EORKxn+H8vnd9JUBKmwNrj7hlaOPPUSsQqKGKP4ZlizdIKmWVVSWCK
	jNULhPAcCcKHX4ciEe7LQIaQ0S77Xjopxdr7GzLHyYTcUj2MhUpbnMHCzaTpI+b4RzlvxMKPtTD
	fSCWOVzPjc/4I3va0Lpdo87gFyZlirK1H4CpgIWPifcJ3xBhjyXckwxJn3+oeWR6kKSj743T+Vi
	LWAS/CNmIMPFKHg6NaKQYHftLR1diVMoH19ivEsikGsS1yzMPTYMKISDuJlQA7cQ/yvndg3towl
	P5yGvP3oz2nhmRAJ8NFMo/EwfTWq0iUPGRSqZ5sfHhPnzOHSYiNgvP8wnZv7QzpTb+4vti0xCZp
	P1HzVbDITy3BGoSjut1bv9lpuffOfYhTXrJVZYES/TGYZGHmA2lrmC8R0p9OxLgT+R0eHkHlHIA
	==
X-Google-Smtp-Source: AGHT+IHXI8ToUsXPn1H/3Ag+W1Lf4830EcbI35NKWBjF1weadPXztynkJTg8EPbjmSTpnwucHe3dOA==
X-Received: by 2002:a17:902:ce90:b0:295:8da6:24b6 with SMTP id d9443c01a7336-2962adb1280mr71683995ad.40.1762380407441;
        Wed, 05 Nov 2025 14:06:47 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096dbe4sm5587205ad.11.2025.11.05.14.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 14:06:46 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, rogerq@kernel.org, tony@atomide.com,
 linux@armlinux.org.uk, tytso@mit.edu, lukas.bulwahn@redhat.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] arm: omap2plus_defconfig: enable ext4 directly
In-Reply-To: <176229761977.2840692.1048568589731485574.b4-ty@baylibre.com>
References: <20251013120753.101582-1-andreas@kemnade.info>
 <176229761977.2840692.1048568589731485574.b4-ty@baylibre.com>
Date: Wed, 05 Nov 2025 14:06:46 -0800
Message-ID: <7h7bw4i16x.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kevin Hilman <khilman@baylibre.com> writes:

> On Mon, 13 Oct 2025 14:07:53 +0200, Andreas Kemnade wrote:
>> In former times, ext4 was enabled implicitely by enabling ext3 but with
>> the ext3 fs gone, it does not get enabled, which lets devices fail to
>> mount root on non-initrd based boots with an ext4 root.
>> 
>> 
>
> Applied, thanks!
>
> [1/1] arm: omap2plus_defconfig: enable ext4 directly
>       commit: 810c5ef6efe9a2be3203a50de781d9050e8b9920

I ended up dropping this patch because it conflicted with patches
already in Linus' tree

  c065b6046b34 ("Use CONFIG_EXT4_FS instead of CONFIG_EXT3_FS in all of the defconfigs")

If this is still needed, please respin.

Kevin


