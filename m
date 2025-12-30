Return-Path: <linux-omap+bounces-5293-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D158CE971C
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 11:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 155083015E32
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 10:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFF12C2349;
	Tue, 30 Dec 2025 10:42:49 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D88A2749FE
	for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 10:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091369; cv=none; b=fXBTPBnUQ+8IiiKbdGSILLii/gQ6KHr8uzbE9dZKalrtesq9C6EyeYrsLozQ3xhUJK7uL0UvGu7DxM9vCaaozLMS7pUFhxtB0LIXZFcGvA3GVSVdzF+dOQa4ak5knr52QuUrkJERq2yYvYic3uFI5+de/5XyLWF7VOxZQSxTUrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091369; c=relaxed/simple;
	bh=0B/Bipl7+h4OUQlhrKD7iLvmec+IqCXBh4udpZHNfVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mkwQrnUiURXArk/TKO2k2G7xS1R2ltH4VZd/wkbhyZzE9S+Z29unKFmBERGbT4ZnCzdqi3k5f5MGVMhZ1oCH/0EGJls3je6erftuXmy+OjtqjfxjdbV0L02s7HHLNq94NihNMGJfUDhTOJMJB2RmFIG+kNyLtetDC2sjKLD3O4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5598b58d816so7259375e0c.3
        for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 02:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767091366; x=1767696166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+mbKEnmZAcKrKemN4xL227aXv/cGZhXjnFcbO82dy/o=;
        b=izDmYCPtUSLalUa2zTWNxb9NTHOnYMfpT5JFD9uOYyHom0ugts2/nmq6Mjbt+ysfF+
         cY+XP+8kGSay3rAglLpGSOd/iMfWRJiZW+c/NkuDinKBuHpwFvPHcdOLFBk/JpI3sI3O
         GpT3mN/rwEa5/Zlrsa22eJrcJ3mpMjz5hvt37uH0PXBHx4bUVyllp/m4BwLd+ciuurew
         hQNpKVA0CfxvTO/MkRfLqij05rpo9dJ++HOzy6W/eQvIKia5IK/g2vKakRZUcFo1VzLr
         6pXvPrdSq+v3YSVUunC/jb49qRuuQYTQGIpWD+yKiV7X08Hx7Y3fue5+vcbMRKOHASB5
         rJNw==
X-Forwarded-Encrypted: i=1; AJvYcCWwZp438+rJoOy8v3oIVwCI1Vuu9wt9pkXx07dtyTeLyntfADVyzrFCslJHemYj4AG0O1LDpwJh4wPL@vger.kernel.org
X-Gm-Message-State: AOJu0YwcSGT8HeRIIjSxHYvKPKHsBa4b3B/gI0cAFXWGPBlZ8+XyZJvx
	dDIKpvtU3BHRfBLotYMQ2wpPBFmg8cXFOkMyd7OFc1IpRO5sNqpPHhhvX5q1wLHk
X-Gm-Gg: AY/fxX50ZohXDacg7Yv266GYsGsFNWdx+IJRgsehNG9kWkdoAW+yhSzCENhveX+yAXX
	U/lyd4a3VJ0x8DfsomSF/JvD4FuUdPAiA/T6fDfv+umWEuQFBitKCUruyTNqMN3vyJgev15iTdU
	SZDg/B8GbCAlN2xTZUxWcJQtDeKATtnQjsZ7MgB7zhnlQhCQ3WXsy2WhzMxq60CI5eckM0B/g/T
	AxaP9UgKt/rkz+JArwUr7990b26+s3Jk9/u8APV71W8BceOGk+BtIWNULFRfaYnPnKGLNjnrazl
	HT3UYnV/PwIjDBssfsk3eLbYFKEmJEMwbWZJvMxAe2gG3TkzW00GNOSP6T2a9tGQldGrWkpYFEL
	C15epgqfBiuF1T46HbiKS5ugnAqQe8ins/UDsldcWqydZdiIdulFJgIglGlIYTojCU8QEyJvAhB
	0DeaILu1DCdEQYY4KAI6NJoMItKkIEkzM0ke0a2KnIuaw1ilx1
X-Google-Smtp-Source: AGHT+IHGbU64SJ5S+nvKSkprYw5QW2it7NG91IMguUJokqc6HgW5wQTjS9N1OswotOh+dONKO2PKHA==
X-Received: by 2002:a05:6122:a1b:b0:55b:14ec:6fb9 with SMTP id 71dfb90a1353d-5615be767d9mr9437159e0c.14.1767091366508;
        Tue, 30 Dec 2025 02:42:46 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d06627bsm10132743e0c.8.2025.12.30.02.42.45
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 02:42:45 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ebf4d3b1fdso123934137.0
        for <linux-omap@vger.kernel.org>; Tue, 30 Dec 2025 02:42:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4D22yCXzkrc0dtpTzeF90G5HCFZuVRrUe1vLfsdVKmt3gbtJWUFIvAedSUmLk9Ya0VbkYpDQq1YoB@vger.kernel.org
X-Received: by 2002:a67:e702:0:b0:5de:31b1:1ffe with SMTP id
 ada2fe7eead31-5eb1a827522mr13153064137.32.1767091365057; Tue, 30 Dec 2025
 02:42:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230052827.4676-1-chintanlike@gmail.com>
In-Reply-To: <20251230052827.4676-1-chintanlike@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Dec 2025 11:42:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUEXBRW68sPMrVX5B6ebtbbS93umtrB_BZsegD4mym_+A@mail.gmail.com>
X-Gm-Features: AQt7F2pZRr92trscSLmSOVfaiLPojcm1vUHVQnsT-rKg90xEirIjjF_9VqRIcIM
Message-ID: <CAMuHMdUEXBRW68sPMrVX5B6ebtbbS93umtrB_BZsegD4mym_+A@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
	deller@gmx.de, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chintan.

On Tue, 30 Dec 2025 at 06:29, Chintan Patel <chintanlike@gmail.com> wrote:
> This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
> it only for sysfs interfaces, addressing Thomas Zimmermann=E2=80=99s TODO=
 to
> remove hard FB_DEVICE dependencies.
>
> The series introduces a small helper, dev_of_fbinfo(), which returns
> NULL when CONFIG_FB_DEVICE=3Dn. This allows sysfs code paths to be skippe=
d
> via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
> full compile-time syntax checking.
>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
> Changes in v3:
> - Use PTR_IF() to conditionally include overlay_sysfs_group in
>   overlay_sysfs_groups
> - Decouple variable definition and assignment in fbtft_sysfs_init/exit
>
> Changes in v2:
> - Add dev_of_fbinfo() helper (suggested by Geert Uytterhoeven)

by Helge Deller, not me.

> - Replace #ifdef CONFIG_FB_DEVICE blocks with runtime NULL checks
> - Switch to fb_dbg() / fb_info() logging (suggested by Thomas Zimmermann)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

