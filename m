Return-Path: <linux-omap+bounces-532-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D784DE47
	for <lists+linux-omap@lfdr.de>; Thu,  8 Feb 2024 11:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A29C283B02
	for <lists+linux-omap@lfdr.de>; Thu,  8 Feb 2024 10:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8296F075;
	Thu,  8 Feb 2024 10:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OvwvRYH4"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6FE6E2C7
	for <linux-omap@vger.kernel.org>; Thu,  8 Feb 2024 10:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707388047; cv=none; b=PXuIv4AtrVk5jaLs3jpjLxN3o4u0OAD+c+1iG/vUOfD8yU/imB5pWtVjHFdziIGVFPvffr6T9TPN2zH9tMWAuu77WFY6IdFKdA9vUFQfhShCfKHRzWGkE84JBijrUiiJEbpu2oiZuDIqko57Tcy6vPfgOG1xzVfsa8QRZd0fFeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707388047; c=relaxed/simple;
	bh=HM4s1IoYKrqbTBD6jS2cOV0hkx3RgIZeUicDtVWhmfk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D05fB/d7taUByV3WLICvAi2yOqwynRfmk07iahKk9vxpQDMaQ4PW2lG0DjBi7ZtRBllOpS01TTdRd6N619mH2X+wcKRzEzmAOi7bxuQFN2WmI0NSHlML/9RDWYkkIo+h8ZMDgHlO+TKAc7hMgf3qvk1KXt11KjCN/br3oX6WkQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OvwvRYH4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707388044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HM4s1IoYKrqbTBD6jS2cOV0hkx3RgIZeUicDtVWhmfk=;
	b=OvwvRYH4flljgz1GfIsEepSy1T+OeTJqxju13+TEcAPEZstUkhgQq+r+G1uAhOJeeRG/Bt
	aKgrrafh5Syl2aMx8pO1taw7BRmMRV/KhhtZDT2TgmbBlj60is8cmPKaovx1uQaLhwiy0g
	JAPeSWM242RxUnx9u/NDWiw7nEg6YeE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-rDxx_nRgNzujjQzkV_x-lg-1; Thu, 08 Feb 2024 05:27:23 -0500
X-MC-Unique: rDxx_nRgNzujjQzkV_x-lg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4103b912372so904125e9.0
        for <linux-omap@vger.kernel.org>; Thu, 08 Feb 2024 02:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707388042; x=1707992842;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HM4s1IoYKrqbTBD6jS2cOV0hkx3RgIZeUicDtVWhmfk=;
        b=bcQLU3/xvsHKAvvMFLVoJsMvIxoif3HlLpRecZpwJTHaYS+KRZB39wI0MItGyykZxH
         Be57os8qdzzpu8do3JgZEyxA+DXLExbNeolz62h43kcqvlIkUcucUhFNT5+NU5NPpFz6
         GGM4oUub3ivBdaRCPJ9VjO+ZS7vOE4CYeSxxr4V3tJ5MajudCKYUxxvR74/YIpyGI169
         pPTk+fGZstqkXIE1Iruk+xtNcP+bnPp0+5tPTx4ZrRhoZJoaiiDxCDVg87jiXRmNClCh
         tt64CHOSFjo2QSZDSKcpvxcJzGyPt+ZYn/VyuulWyFoA/0XWKpOgfBTQb9yhZu9FLuSx
         UPtg==
X-Gm-Message-State: AOJu0YwUlAAATdVyAyebt2udMtyWoksUG9o+UZKyMm3I1qNsm8XXzssW
	Na9lsJqF5d+Ew6dFXvPorIWzqCXHh9PDRbv7OsuOKco6xpGsYK+FBsVGat7B4L4o1jWFLMqft4M
	1bFK4q2zVCgbTtEJnVrTp8LFujMjfYnnH0cPPvZoocXunp+aiii4R10r94Fc=
X-Received: by 2002:a05:600c:510d:b0:40f:8245:f46 with SMTP id o13-20020a05600c510d00b0040f82450f46mr6573147wms.0.1707388041840;
        Thu, 08 Feb 2024 02:27:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjdph97XOlaKE6uW5pBN20GXyoDscvh9el7vzJ9Q+KOfjVfnfTQo8uIACkaI7uYqUDxMOVBg==
X-Received: by 2002:a05:600c:510d:b0:40f:8245:f46 with SMTP id o13-20020a05600c510d00b0040f82450f46mr6573138wms.0.1707388041459;
        Thu, 08 Feb 2024 02:27:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXc/nlag3rPyHojq8kZ8l8JKwBYNo3IGEiNO5ACkUhV3XbhLaqRCokvXk7zjRKHrohu0UxePLhJgGf+K2L82do7yG1Is6srpasxDreCUvkP9AasuvrWml1RZfDQspo5uWlnA/NxWGqiHbC/+ispeq4zUNwLxmDRt0f+h5MtS4b1ziC4GXdCFuY211SlfJ1fcHtiCeWVrZ3jJ8eVgrXS4RS4jN6ID94VrJm9WRgVOjQ3/MrffizBHgE2Y8/Rbp5/AaHkZqn+d23VL5oIrA==
Received: from gerbillo.redhat.com (146-241-238-112.dyn.eolo.it. [146.241.238.112])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c3b8a00b004103e15441dsm980949wms.6.2024.02.08.02.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:27:21 -0800 (PST)
Message-ID: <ba0196d4b0f008e146dec58f74142a918ab1986d.camel@redhat.com>
Subject: Re: [PATCH V3 1/2] net: ethernet: ti: cpsw_new: enable
 mac_managed_pm to fix mdio
From: Paolo Abeni <pabeni@redhat.com>
To: Sinthu Raja M <sinthu.raja@mistralsolutions.com>, Ravi Gunasekaran
	 <r-gunasekaran@ti.com>
Cc: Denis Kirjanov <dkirjanov@suse.de>, Siddharth Vadapalli
 <s-vadapalli@ti.com>,  Roger Quadros <rogerq@kernel.org>,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org, Sinthu Raja
 <sinthu.raja@ti.com>, stable@vger.kernel.org
Date: Thu, 08 Feb 2024 11:27:19 +0100
In-Reply-To: <CAEd-yTSXJdm0GQfA1HxHp7ACaHt7SdhYNepbwLtmc7PJETTzpg@mail.gmail.com>
References: <20240206005928.15703-1-sinthu.raja@ti.com>
	 <20240206005928.15703-2-sinthu.raja@ti.com>
	 <2ffdca7f-f865-b719-b701-9ed4716da71a@ti.com>
	 <CAEd-yTSXJdm0GQfA1HxHp7ACaHt7SdhYNepbwLtmc7PJETTzpg@mail.gmail.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-02-06 at 12:49 +0530, Sinthu Raja M wrote:
> On Tue, Feb 6, 2024 at 11:31=E2=80=AFAM Ravi Gunasekaran <r-gunasekaran@t=
i.com> wrote:
> > In v1, you received a comment to add the fixes tag. The reference stmma=
c patch also points
> > to this commit as Fixes tag. But as Paolo pointed out in v2, this is no=
t the right
> > fixes tag for your patch series.
> >=20
> > I did a git blame on few drivers where PHY is managed by MAC. These hav=
e
> > Fixes: fba863b81604 ("net: phy: make PHY PM ops a no-op if MAC driver m=
anages PHY PM")
>=20
> Thanks, Ravi for pointing this out.
> But the warning message was caused only after the below commit had been a=
dded.
> 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state=
")
>=20
> With the below commit the warning didn't pop up.
> fba863b81604 ("net: phy: make PHY PM ops a no-op if MAC driver manages PH=
Y PM")
> That is the reason I have not changed the Fixes tag.
>=20
> Let's wait for Paolo's comment on this Fixes: fba863b81604 ("net: phy:
> make PHY PM ops a no-op if MAC driver manages PHY PM")

The main point of fixes tag is helping stable teams to backport the
fixes if and where relevant.

In this case the issue addressed is arguably an inconsistent state,
which may lead to later functional issue. The warning emitted by the
phy core is just an head-up, but it does not look like the 'real'
problem.

An older kernel including fba863b81604 but not including 744d23c71af3
will likely be prone to the issue.

TL;DR: I think it's better to include both fixes tag.

I'll add the 2nd one while applying the patch, no need to repost.

Cheers,

Paolo


