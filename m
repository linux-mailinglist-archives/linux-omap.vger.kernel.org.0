Return-Path: <linux-omap+bounces-4633-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC94B56840
	for <lists+linux-omap@lfdr.de>; Sun, 14 Sep 2025 14:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFDD53BEDB7
	for <lists+linux-omap@lfdr.de>; Sun, 14 Sep 2025 12:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34011487BE;
	Sun, 14 Sep 2025 12:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HmW7IKij"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749921B4141
	for <linux-omap@vger.kernel.org>; Sun, 14 Sep 2025 12:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757851498; cv=none; b=Dwp7JxM3zL/xNNiyeU05Ksj2HrmFMOP6zD2SeAe9fL656QwaA0EOvPDQHPki8g20XyJPBmxaP5l72jEpdIRchrdWfnwdvHFdr70U4lmU2fzriA45NYkcLDgaiig8RwIs7moBDGFtRV7CEVn5PkLu93kwUtYRnJzYDDn/JcxBWbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757851498; c=relaxed/simple;
	bh=x6/x/F9H1jnt9+oD8dGb+mTu5SQ8wNiEgVuCPP1souw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkJ6w1LGV71VMXVLj6rsaDkj03ybpQ7y9xtlrzvK5+NBXfJi6FGksV2avwcIwc4EL3A055Cdc+FgsRnLn68kBBXHiISrJCLbttH9Jr+cMe5UoyhrKiZ8lPee0qXTmRAmM+zMD4/NyQNcbsJupFM+DaUs4vdJ4ICOsm9qcNrY5Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HmW7IKij; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757851496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x6/x/F9H1jnt9+oD8dGb+mTu5SQ8wNiEgVuCPP1souw=;
	b=HmW7IKijo9YBtew6ZyocKIXibVimANFTyoqu9R7DcAalTq3dLYAMDgHKIkrq+X3LbRpN0h
	u0YWzuDOwUaE4s93NYAnPa00ac+pP4aYBnKIUA5OBukvKHCpUusZDkT4XYHVINkpF9unc3
	QLNP1rCjzDx/0G1c+eyY7i6bgDC4KLk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-lYjFsFk-OyKv9UfbUJiTIA-1; Sun, 14 Sep 2025 08:04:55 -0400
X-MC-Unique: lYjFsFk-OyKv9UfbUJiTIA-1
X-Mimecast-MFC-AGG-ID: lYjFsFk-OyKv9UfbUJiTIA_1757851495
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-77ef97f684eso6827996d6.1
        for <linux-omap@vger.kernel.org>; Sun, 14 Sep 2025 05:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757851495; x=1758456295;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6/x/F9H1jnt9+oD8dGb+mTu5SQ8wNiEgVuCPP1souw=;
        b=H2doe3f3Uho6z723a/tKOKD8xA/4wnl0C/+68lFbT/yTmQAf5b8IFtZW8TwdvOKf+a
         s8BO89bexYVkPY6RKOjoLmztndyUAaXcI6BwnyDj3wMdb9EQHtsZ9WCl4tx4XjGU3AQn
         82y+/1+CKfMUO9NGK1xVWrq9QEFUOQEm9C4J8eDrFsxg5ekx1x7cYNAMMXaIcyI5O2R4
         MWTU3GlHbA7Q92Jzsp/JiES2iLSyHUtmWQN4+Oo2IOUBDhUm9ymUU2/8X+Y0BcgpL/2a
         PsOd4TAbv6cIeRm+wUX6IlVEApQw95UWpsE5xozvjjOce640Drfl4b3avuxgM9xww7cd
         0JwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX30E8hPpQLNfowabnyq1eXiROKtjbFyMsLapcbBtOw+o1w5urcQynRMYBttq1P6b5cL19kdoA3cwxv@vger.kernel.org
X-Gm-Message-State: AOJu0YyJS5RLjLxHoft8a5PAF4brKCgUH4d9L2GVcA1+oXTzqmpoEPE8
	e2PXkx6bscy6UxmDfLOhNIIqd3EFMoXvnpqZhJACcQS4R1OLuEfeaXS2TAfHJ3jHKYOc/0zrMPA
	MbLy4s9GQB5nuV3C7nAdgy1C8hKSkCX8uZx1PjV5DaZsTKpcSjQoXLCwYyWUKnXk=
X-Gm-Gg: ASbGncsYjx+bSddo5ar6B/pOiHZoWM55ZpDlBboZVEiPJf7sKRiIHNO34UVjhFVA4mp
	klf7dGEq9H+REPsRjfX86Z8O1cLCJEsQshxdo1TdxvBVJdEJwgN7u1kQqUDH4dwGtIjGzYz7nOp
	lDrgXp6KPZ12RHUoq4GVVSqnzueBpYfuPny2fK2+F/0KMF5RcrtL7I01jWbXIKK0wSBQ/iBP+6J
	re3jkLuEhzoqUtb37wqMUAlMP6a8v2Ixu382Vs/dQdoK+1wGEubXcEZ4X1Z+TBKavQSDL4p5gik
	/QmKWYV4sldx9UI4XAUkUNrvpc0NAiOfe5TNwwlic75uj7Mw3UeUodtE2Be5ocEv5q3AcKbywrd
	rQGHRyjDmLhsY+yMEgqALCpk8Ie7/1zA=
X-Received: by 2002:a05:6214:a54:b0:77b:dd92:d8d3 with SMTP id 6a1803df08f44-77bdd92dc85mr17330166d6.7.1757851494627;
        Sun, 14 Sep 2025 05:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECmPphlLafTRPXos3E/qMQLqgcw4g6SL9e96QNHBNQO+FV4Ve60CSx7PadzySEh8hyBowFVw==
X-Received: by 2002:a05:6214:a54:b0:77b:dd92:d8d3 with SMTP id 6a1803df08f44-77bdd92dc85mr17330016d6.7.1757851494267;
        Sun, 14 Sep 2025 05:04:54 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-778d99113d1sm16067766d6.68.2025.09.14.05.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:04:53 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:04:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ARM: convert from clk round_rate() to
 determine_rate()
Message-ID: <aMavYz5z_CXMh8MD@redhat.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi all,

On Thu, Jul 10, 2025 at 07:42:15PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the arm32 subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian


