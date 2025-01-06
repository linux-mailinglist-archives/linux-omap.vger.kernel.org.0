Return-Path: <linux-omap+bounces-2992-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13373A01F7D
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 08:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ECF9188167D
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 07:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A24E1CEAC2;
	Mon,  6 Jan 2025 07:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNOBuGhq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01E14C6C;
	Mon,  6 Jan 2025 07:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736146952; cv=none; b=LpeBIdQo+/RFwFbcfzjBVnm242YFWvkIcGauo+guvnD8+T36/VQbtv9v3XR1FFKRC82xSMs9i13UY2KrwnnyDWlNrq0zRWo9Oia7DvwXcscsLNDyYQ/1XKFXiFnjZBQRTASOKkd6yKuPeFqLeLTYNZhybLQeEMg+GgBuxZZ3GbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736146952; c=relaxed/simple;
	bh=CNHa99aCvZijjAmw3I+ReetFhL0YpmYv3/j3ft/h96s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzN8qK2Prrmu6DM1tx8kfpOwQLateroKuQWb/HXm7pXieLzc9N6cpCC1VKVCdldSqjshFKQtLbmodAFXZ3/B1/V7iZw/CnM6eJlMVehyANdwHzUvq56BWSp19447IJd+3RhlTrSUK/sFAijDqZs9bZBTltptIYUJYJ03Dy0t/hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNOBuGhq; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f441904a42so20552867a91.1;
        Sun, 05 Jan 2025 23:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736146950; x=1736751750; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GGVJtGQb89wlcVZ1YDwZA5RSOoeiTpH1BZfBuIevwNM=;
        b=GNOBuGhqx0ttQPuHYxZp1kctfuvtp0tg5HOyIwUilhjVqC7sisTjIWeIF9d179ChKF
         SuBLBGCzS3byez6KyUF6yWI1MV7gUtvmYBR6EeeBLpbOzxo3Dvm1S41vnTvDtksuBSUl
         FYEY5D+xAh+ctHhvrift7FoZy0lkhXKFOws4iqvaATpSixg1mpGQZ467VOsEjUgdTTGm
         aZAC9RVYGbGD+15Qx48wGKQ+GNv74crtg2qbyCMDL1iunc5/n63ULc0d1/2PU62+NME9
         /Rvh9nliNrHU2hnWLpXpuW2JQ2tmugqy0aTsWtHdk/e7sNJLFxvto2FRuQpIz1btNZdn
         Ohtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736146950; x=1736751750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGVJtGQb89wlcVZ1YDwZA5RSOoeiTpH1BZfBuIevwNM=;
        b=YF/9a9Wyg37c1Ek+RXaDznVh1mVu74aX24veJvwkxN2UbSggWwPhmWOWTZmhb9Ymwm
         kpkWechpg6S4BZYKh6l+GwKT1J/YnYYRRc5h4qUJG2mQvDEvX6x5xrC1Z36FBt9DQTI6
         /F0izP7SDU2lfANTLQPzW8BtwH8C64+00qAgBSXFHCHSufz31MwvElJ2flglZFLIzjbF
         +D7TE1dsoyCksOooj7/xeEkGAWVE+fHldyZPKiZ3xdoumwnpcB+wnc2cdCEck0AsJ/nv
         NthjZcJzrxZHkdyJnyS+VfLoMbQy1IzFgLaBTv4jVbSTBcZR8bDhJfmx3c+uKOUXl4aU
         +/jw==
X-Forwarded-Encrypted: i=1; AJvYcCU8jDI06K/h7GXP+kiso11XoY/dpVKoUS58jjh7mwqcA4zlX4u2bDFDFVigPY16sAG3bVe2QkWh/B++nsTc@vger.kernel.org, AJvYcCUHMrkh8L770DQLuFYN9Bz1GQ5K58Ohp9P4vCWcwi89Qg5MTSYilQ6f+5wEvtg4n7J1E1wXLdB5JXU2GA==@vger.kernel.org, AJvYcCUXiy6GJtPKOWGL8JBfqH2gwOj67Js9+scS/arNHqybKGvfRhBYM9x+aCfFUcSHEMaPW9zsH4eM+NfNdw==@vger.kernel.org, AJvYcCW54JRDXOgHMZliDEqXB9zkI8gBQsVl6e3LDzF21J8/isbqPPQyr5lETZ0nxYl95JB5lOasH4s8AIqZD4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7EdxNyRAYxbWkHlfZplq9hwXk3ZMp9zrkyBej/Bmen7FrgxmA
	qX50NoSBUrGvUSaaoD9gr/CTn33WadOxLBqDxhDu6kvoZWTAvIaI
X-Gm-Gg: ASbGncsYgVe8tMawK/aOHA7KZLQi+eV1GvF+oW37/xG+a4nEqTK9Y8cjX5H00595ecY
	mAdNFd51S7wdK/uncw1Xdr51G3wPHpZneYcprKRbyYxf5wE4lGy0CGAIeROkJ3yrkwuCJHG3Yn3
	Sug2dIKEFKAwSIn62AI8xAkdIPm+az1hDQh778LM2gEZ720zx0q0x+ZcNrrGyRGn+Rm+jnAw4AK
	X8/L4yxraRyUrkZOXOgHWWSJuQ5CdgHFry9SBxuSGjcH6RWh1xQHUf+ZA==
X-Google-Smtp-Source: AGHT+IGcj7uesxm5i3Q36YxBjuvQdeGPVoif2UeSd9UZyIO4K1XAmlD0C5h3lAY3A+npBxRoCijVwQ==
X-Received: by 2002:a17:90a:fc48:b0:2ee:c059:7de3 with SMTP id 98e67ed59e1d1-2f452e3a9efmr80284104a91.18.1736146950094;
        Sun, 05 Jan 2025 23:02:30 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:6998:e192:65f1:e7c0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477ec539sm36306840a91.28.2025.01.05.23.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 23:02:29 -0800 (PST)
Date: Sun, 5 Jan 2025 23:02:27 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Helge Deller <deller@gmx.de>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: ads7846 - fix up the pendown GPIO setup on
 Nokia 770
Message-ID: <Z3uAAy5vF2ezUS2c@google.com>
References: <20250102181953.1020878-1-aaro.koskinen@iki.fi>
 <20250102181953.1020878-3-aaro.koskinen@iki.fi>
 <CACRpkdbfuQuTQ028=hZgRhOPiw5AbPLyoZTbRCbvNDQ-e8UajQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbfuQuTQ028=hZgRhOPiw5AbPLyoZTbRCbvNDQ-e8UajQ@mail.gmail.com>

On Thu, Jan 02, 2025 at 10:32:00PM +0100, Linus Walleij wrote:
> On Thu, Jan 2, 2025 at 7:20 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> 
> > The GPIO is set up as an IRQ, so request it as non-exclusive. Otherwise the
> > probe fails on Nokia 770 with:
> >
> >     ads7846 spi2.0: failed to request pendown GPIO
> >     ads7846: probe of spi2.0 failed with error -16
> >
> > Also the polarity is wrong. Fix it.
> >
> > Fixes: 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
> > Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Do we need to have this knowledge in the driver or can it be handled
in GPIO subsystem or affected board support? Requesting a GPIO with "in"
direction when it is also an interrupt source should be pretty common.

Thanks.

-- 
Dmitry

