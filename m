Return-Path: <linux-omap+bounces-5265-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D08CDFD84
	for <lists+linux-omap@lfdr.de>; Sat, 27 Dec 2025 15:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9879A30321F8
	for <lists+linux-omap@lfdr.de>; Sat, 27 Dec 2025 14:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7C631AAB9;
	Sat, 27 Dec 2025 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBUf+WMC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5970D320A0A
	for <linux-omap@vger.kernel.org>; Sat, 27 Dec 2025 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845351; cv=none; b=ga+noVMD+qXGF5sJtK5HaMOG9XGQiuPT14+wl6J4Nvwo8kBXrt8JmpYZvfHzr/W9hLBTQ3hmgcOsnkOhzabazYcwxNDPyz42j+UfKKJK0QD00nA9Wr7dHBKRGj2IXzxSilMEPGHLPfoEHQrYt5Oo8bbkt3NcDKaRY0ZMywsz24E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845351; c=relaxed/simple;
	bh=8YtmJWxVLcTXPglZgU+78L34QqcvuKoQn/q5GRMHn7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDeRmugFuvrXYiyk8Nllc7TBqj+lW4U9/EUnGMHXgMQAVbHZKkTfchRjrNjjl15XwNC2RAkXjbbf37KLKJm0geH/Szok6r1N1xSYhrF018A8Et4nPtjogCg1Wih+nx/rlmgA64/ZxosA4Om5N59HB9w6fTYtQuHJir23b+hLZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBUf+WMC; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b802d5e9f06so1008718666b.1
        for <linux-omap@vger.kernel.org>; Sat, 27 Dec 2025 06:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766845348; x=1767450148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsY2YPUX+wtykoq8K3+fTG9jA80ktVPXe78RbmtQw8Y=;
        b=dBUf+WMCc5m9G/KFx6Xr+dzLMPTW8JT0qBeNr2rQqwts8t/Y1Q1cPNIUTZ7z+koEBl
         L2Jjb9rQURpUmmGfgFZZdvQJ4GTUPPrJbRinlIwoxFH+zzqdlIufSZ3L4ZMdgOdQZ7Tp
         TB6y87n6tJiEI7+nxXoHYfMnsVDT2qyHchY3DpUfmfuKPoCbEleBjApYCmhVGoUNAjPy
         Q+NMNIhg1M1CoOklGlp9NvS43Rbd5BSq+tHsenp80loXrvDzgQVHXKREm1NJ8Mh1f/rK
         4FsDJI0SXzKwznrlIJKMA/PVHxNu+V1M17XjQkB2lFiCb4S4i95rnDGPn0Rp9MddOWjk
         8SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845348; x=1767450148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wsY2YPUX+wtykoq8K3+fTG9jA80ktVPXe78RbmtQw8Y=;
        b=j1GDGLZFlaIr38TkXp7ylZzH6G5wx18drqmQG9ydEi9kyLx9W4iKgq/JmqwQDaNTsF
         wks9CDbWbBTw4k1UD08IQG/MdSPrCQz0U/2sOJ2p11x46B2RonhzpT/R6KVLMaoknofF
         nnrSvva0f+LAAyNRPGG9a/L0LOi2MxcscKQ6IGfK25OM4mmHfeRJ6pBj+2U3RA/VwVfe
         doJgpEgUMDhftEf3te3o1Ql2a4lXxZmjSd/AzSgnPBolLjuUFO/8P/ZyuA37Qaa5FLjn
         11G5/GUMR9PL6E/rDOrBqSWeVR4qVAHAYUtyVlnl+OVTGVDKDVBhS0Q1TeWzZAbgnk0+
         nTYA==
X-Forwarded-Encrypted: i=1; AJvYcCXSjqUprQeqvyOrOmUAyTLm1mjTNjr0HACmUVu92ah7sXpdOPH2WoNWbE7+vAX+FdBkQlr/DwHcE8OS@vger.kernel.org
X-Gm-Message-State: AOJu0YwDIJ8tKrS77uF17LQMd+BLtH1hNyizCEfrQmvn6xtrtaYn/pkO
	Yg2x6pmh7oWe7sFFCjrXwFEAsEmyuJ5gCnY+8ksDfuCShQwaJ0zbDwWRiIuF1zJ3HDRWNBylKm3
	uYuGtaUvyJL0eXz/PWSe6hq32eHlJMZA=
X-Gm-Gg: AY/fxX4Q9eiDofKlhQsrJezf8WlDg3rF1OfNYPOh/XArujrXGYVcCOhWYKtX+aeZLjy
	luUtVN6w0xlPJm6+BfqrddD1ZQR3yKuMAXmFb5Z9FfqB9uRkPkp8FrPB8u7rqEhOeZtoAbGz0HI
	SdYFV2ZGodp3+9ajfE6phrbIGLGO5CAM90OiZOEamlxNasZVqckFkRe7aD7lFtZlZSNS8VynnuW
	lfGuPBMWtWgEqWORkUonPh+CWjw2M1nGKFtIKp2f/qvapaySccQ6ZEg+ROBVMoO+ulpt+oLHy98
	3vgozPWwHyRA+75XFSth0X2yFquCyi01lba0UY+HZ4Wup1z91ARzGIY488JfP9TWC+WBqS8=
X-Google-Smtp-Source: AGHT+IFueBeZlh5SVe0yz+/yxQv364cBzdkglW+0ZdQCwGpAc3nvuAc182enll5nZikPEvfIE1pSBxl7zDgGxVvO12k=
X-Received: by 2002:a17:907:2d0e:b0:b76:bcf5:a38a with SMTP id
 a640c23a62f3a-b8036a924ffmr2886902566b.0.1766845347379; Sat, 27 Dec 2025
 06:22:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com> <20251219054320.447281-5-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-5-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:21:51 +0200
X-Gm-Features: AQt7F2pBB7tF8rd4vW2CaPeAEaMHCh3Al7Dq6z2gzKKZ-tCgBNcws0oMLkjEaOA
Message-ID: <CAHp75VfTki7r-BMadsmOWudr2nc2f2VYgL9y6xR64usQB70ZAw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency optional
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
	deller@gmx.de, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 7:43=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:
>
> The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but th=
e
> core driver does not require CONFIG_FB_DEVICE.
>
> Make sysfs support optional by defining overlay_sysfs_groups as NULL when
> FB_DEVICE is disabled. The driver always sets .dev_groups, and the kernel
> naturally skips NULL attribute groups while the code remains buildable
> and type-checked.

> v2:
> - Replace CONFIG_FB_DEVICE ifdefs with NULL overlay_sysfs_groups
> - Always populate .dev_groups

Same comment about the changelog in the commit messages.

...

> +#ifdef CONFIG_FB_DEVICE
>  ATTRIBUTE_GROUPS(overlay_sysfs);
> +#else
> +/*
> + * When CONFIG_FB_DEVICE is disabled, define overlay_sysfs_groups as NUL=
L.
> + * The compiler will optimize out the sysfs code paths when dev_groups i=
s NULL.
> + */
> +static const struct attribute_group *overlay_sysfs_groups[] =3D { NULL }=
;
> +#endif

Hmm... I'm wondering if PTR_IF() can anyhow help here.

--=20
With Best Regards,
Andy Shevchenko

