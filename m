Return-Path: <linux-omap+bounces-2798-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4C59E9D99
	for <lists+linux-omap@lfdr.de>; Mon,  9 Dec 2024 18:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8AF116661F
	for <lists+linux-omap@lfdr.de>; Mon,  9 Dec 2024 17:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5DA1E9B00;
	Mon,  9 Dec 2024 17:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoWf7f4L"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D951552FD;
	Mon,  9 Dec 2024 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733766774; cv=none; b=fT0IEd4HNCHWREM+h0P7N6u5W/J1H74ShClxUtnGrtFQfVK3/yJcNKNQPC94p8h3OlZz3gUilNL6be8MGPNZIH4MD/KHC2u4yFCRjzmbWB3shh9+dfsKwmDoPll1MyV9I3sJ8OewOz48AzGJux4or04ENdJnWsd5bw7KkxaEcM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733766774; c=relaxed/simple;
	bh=b2xAsLHlM9yQaKNqR22TaD/q8mKFVW67azckemwupFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fb1pJOQIq7qmJRQBUmSV1YUI9WETRNaGEzUYWFXBmQbxnVpZwRvYxIsG+IpGj4mm3ij2HYnkTPmXytvIistm9U4m+vGUlthVz5rTsRSs8sMcjMwmA/38hyK3Zt//Z6QO71+oYv751znF9KNhAx0sMPc1Dg0+ILub14R1eMjiRRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoWf7f4L; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fd4c0220bbso1381493a12.0;
        Mon, 09 Dec 2024 09:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733766773; x=1734371573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=srJyKT087R+qYeSxU+bIbF6N/Np5FthkuLTse+lEca8=;
        b=MoWf7f4L8TsHudm+Z8U4m1jCgWVZrh5BqQG3AR885IHOJKFEEM3mFy+okrfKFTgV0W
         K6D+d5g1+dJrrxooN8xaZym2AV4eozBk6osrr3/tcuB2GI97gHOYKH0u4ZtKGKaWndg6
         1mm8witvUkl8aCM0MyY199Hj6aviQEf8j8r+bD0d/K++qHp8tna6KBcawx7fX0/FHVv4
         vH/qdCtDmGeLGtf/ERvwyahpmuSreHRAFMUp9+z7QzPMDmO4vlqmfKfSzLDL7OEFCMfe
         CYWt/SOiHgMzYtVB1vovhz7XFWHFZz6m/RzkeAZ8S5To/ctE/ZVuRDOt1I7bmUXh5j9L
         takA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766773; x=1734371573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srJyKT087R+qYeSxU+bIbF6N/Np5FthkuLTse+lEca8=;
        b=uJmEof5SeqfjmvSNzk1T5W7fjmVRGP8yJrMcwiM2TeZdrwYh21q6rqH8yfvJMVuSix
         As3ApCP/dXA0Fn/fgYDfgKYa9RmjAlV8mvhkV+hkjY88QvZDuT2NoK6Gdpfi556QpMwe
         d4wx8yGMwWnqRyh0BzwLRcckrGooq6u3mYn9T97kGysPaLkcAV0tZEgSL+OxioUNem78
         ov9IBYxejxDgvzPrDXCwkHldGlITLBNRvPzjsMSrbg5scZlQ2InMEhKUaicpNT6fFC8z
         UKdvvluBgK8MFHvRPyK/fQ2c5Vg5VYYGhKG/QLaYyodpWikSXFchURUYY2CXF2LZneCo
         IoZA==
X-Forwarded-Encrypted: i=1; AJvYcCVfrXySuf3yS4pZIfNSmV7p+6ZjcwoDZWXw4WThnOX6x2Ttc+F7KDD5NJXs8VqbSaNVsybjF5E5ppGqowMB@vger.kernel.org, AJvYcCVy34u1r06J0YnGMb69SrflGci8+Ai0WReK/LbikM7hUNDevhX2RSV6cw/EObOCP8Jx8iM0JzvRUypM@vger.kernel.org, AJvYcCWB3/ndRL6Y6yrgBb6PhHVx5NuxY34JkcnWNs51HYx42+Z4CjIazZI+v/xcyexS6FYHHERcBK8XxA9+Kg==@vger.kernel.org, AJvYcCXFDhcApdHexJw85t4SFOOHg2M1OHDTXwVPF8yFR23eKVOu5Yb0DosmM0mvhxNCwoAK6SL3gPKgGxIB0zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdAPktYSylvBhK7tdgZtgbrun0W6dZF+ChOoAB5dWf52tgq8LU
	RWatG2BNw3W390UpU/UoUBM6TzzRhhIMrc/P4f2g6VmzXpGyORnk
X-Gm-Gg: ASbGncvORLpVs1++vjfA1UBMr5QFKsZbxxNhSlpca8MN4qksk4pzAvZLdLbNtKV/n/u
	K0dpGutWAzJhrl6VWJwY6f76LpJdKvMBtimBKkO35/rwGlWWIlWuCcVpkmY2D6mGydLGnTHgCKB
	2IYbKmYMe+Pe7fo76n61F8C4ZvG4WT1srMndn3IrA3DxdeFpmgpztk0ZOI7XzGuVnu5O1wmdH8c
	X4iveqByCQIlB1J2G5p4swP6JLqBvGTz5CvJgpGxaR/OB6cfca6Xpc=
X-Google-Smtp-Source: AGHT+IEHG2tqXLN8GRZxBuvUZEdZanxc40ztHq3/lNE5ZLDsQXJIq6bbyQKPscFNDt2lvdDTEUr74w==
X-Received: by 2002:a05:6a20:9c8e:b0:1e0:d04a:f239 with SMTP id adf61e73a8af0-1e1b1b90444mr2250864637.46.1733766772818;
        Mon, 09 Dec 2024 09:52:52 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:ecfb:32dc:2452:3a27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f19a6197sm1732475b3a.198.2024.12.09.09.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:52:52 -0800 (PST)
Date: Mon, 9 Dec 2024 09:52:49 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Andreas Kemnade <akemnade@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Tony Lindgren <tony@atomide.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] ARM: ti/omap: gta04: properly specify GTA04
 touchscreen properties
Message-ID: <Z1cuY5OS1-D56M3U@google.com>
References: <20241205204413.2466775-1-akemnade@kernel.org>
 <7hldwthgru.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7hldwthgru.fsf@baylibre.com>

On Thu, Dec 05, 2024 at 03:05:57PM -0800, Kevin Hilman wrote:
> Dmitry,
> 
> akemnade@kernel.org writes:
> 
> > From: Andreas Kemnade <akemnade@kernel.org>
> >
> > Specify touchscreen in a way that no userspace configuration is needed.
> >
> > Note: if the devicetree patch is in without the input patch, things
> > will be broken in a different way.
> 
> Due to this dependency, I can queue this driver patch in my tree along
> with the DT patch so things go in together.  Let me know your
> preference.

Sure, works for me.

Thanks.

-- 
Dmitry

