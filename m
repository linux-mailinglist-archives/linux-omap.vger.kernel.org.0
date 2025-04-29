Return-Path: <linux-omap+bounces-3622-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F93AA0D4D
	for <lists+linux-omap@lfdr.de>; Tue, 29 Apr 2025 15:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65D48460CCB
	for <lists+linux-omap@lfdr.de>; Tue, 29 Apr 2025 13:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D4C2D0261;
	Tue, 29 Apr 2025 13:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="USF1+qqD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263E22C2AD8
	for <linux-omap@vger.kernel.org>; Tue, 29 Apr 2025 13:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932670; cv=none; b=dgaZKG0faJNzoWz2l9F7VbHOiYH3+UyyUL4augkn0+rA6Zm2esn6qDP68YosSEtdrIzDoVCdsUXkWe2XeB7ztSxeI2+ynIuyu8FsL5MCeRBKKAn75v8CVcPyLyW95rrd3j8QYIQoVFY/oHVupSpomFEQ/TTu82FRIEB49qQZ9FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932670; c=relaxed/simple;
	bh=R3HOfhuh4Z/yau6P4o09NM2xwO65jdSQzwa46LoRqpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpoozIbTVoZAnFf9SuJBtMiN3ARcro1TEe66FBGW4lJG47IYqYjVhiFdjZwDHNX7BPnmzFONfQWXPjkyKxgNWgyarsZchhtA0MowHgGSoz4UP43ChQ7l8649HL7/ZaqGStiCODs00e25Oo1gqu6ZxERRPTXc1K/HLhH+hPbB1tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=USF1+qqD; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70842dc27easo53861437b3.1
        for <linux-omap@vger.kernel.org>; Tue, 29 Apr 2025 06:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1745932668; x=1746537468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiU0ctgy7Lku6IPSealurIvtPQsS8cdAkog6qNamfp4=;
        b=USF1+qqDnxgaV+JunfwDta5K4//84DptMR0utZMV8Zi/e7BrwN/vtP9F236HzeIGmN
         TQbzjQz+VT2nyZ2Da5bo/RJjDC40M4Wnv/6MsXXNjZzCCsF1LiHbImFSJ0FHeZMg91Z+
         mp7pJdsf2mEM4gsMYYBHqa9Oo1rl/NFDOs7Vqttex/5ragcvX0WmgwUC9mYFScQKRWBZ
         8E3k3y53jhcq9MPM/tmz3u5t4n+0e1JvZqJlUTeei9CFRpaZUOTGt/5jEd3YxYT4Cay9
         EbmfWlGwc5xtbR10KoWUrCSizCq+em4tKKblOctsgoyKFTSvvWjl4tkGfjxpg3knmD3l
         ka4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932668; x=1746537468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiU0ctgy7Lku6IPSealurIvtPQsS8cdAkog6qNamfp4=;
        b=cSYAKDrFvju209avfn6RBhtTdXORIJaNz+6Pgt+Om5+v/s6XzzkcKrEWubuYgrSiAI
         huwj8uEGy4gXzDIqhk+jbdYYi/bJrAHn2aIvnp0y7sVPpVZtlDLec7A5NoWgh+6P10EU
         pE6ITE58YoWkIzLz6Lvrnpu9u29Sme8ry65M5S34AiTSLruAMz0+wGPcahYUKR4nBuSi
         RPxWnQxJkcN94YghxjGKsu3urXjz0TL5vcvVo9E09W2SBi8niqYyqdX8W5e2ODSFuian
         7NeBXJ4RJnQCNPauDHzIISzy8QhKNQzIFhGQuOM9a/B/+8J38vHM5MQ90ejWwVnFqyo4
         s8eg==
X-Forwarded-Encrypted: i=1; AJvYcCXcu3Q0iLY2f0l363cXVq4lGOl+tz8ZAnfSmPT9EPPcnriSrjlcd9+dMqS4TP6NsQXSeA6V6vUVQlbJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzfxof9duX8LrAv/lyc/t/qVulzL96K3qoytJhJrBDNnCeiKW5
	OI1wF17WZervDiLNajXglxquc6qtbbqec7YVHnBJYJGjQKQHJQwClcfnolGKg6Hq3oNLcxkB7St
	Ulyf1CwAmcSRcfsz8hN2HFeS5shNYewcXJ83V
X-Gm-Gg: ASbGncvJSex6F++RR+CPfAG1iG3U7XOVnMBi6icP/uWy3KhQcb7YB3wGlz2GKRDwENA
	z9knRg3DOtZyCDj4KQnlk1IKoat7PQ643IfES7headCYPUv/0A9dkEXVN8EMVlNqunCQ3n7wFGJ
	ICwuQftnsSgbK7CKHebeVf
X-Google-Smtp-Source: AGHT+IFAkL63cTl/cATNWOg2+YEvpMmi4OYjf4KFpNJEBRA716QUIF33QsNLmMAkg+zJVxgzGQkTVCNVAoMlrQh1Ycg=
X-Received: by 2002:a05:690c:6888:b0:6fd:a226:fb24 with SMTP id
 00721157ae682-7085f1773b5mr194962727b3.10.1745932667944; Tue, 29 Apr 2025
 06:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425203315.71497-1-s-ramamoorthy@ti.com> <20250425203315.71497-4-s-ramamoorthy@ti.com>
 <f92085bd-e35e-422a-8aa3-66e624c44586@criticallink.com>
In-Reply-To: <f92085bd-e35e-422a-8aa3-66e624c44586@criticallink.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 29 Apr 2025 09:17:36 -0400
X-Gm-Features: ATxdqUG2F7x0DRZn5itS7I9rvm7sd9uKgUWiZxhm2pdUZyNe5KbRtX9ZG_d-XUs
Message-ID: <CADL8D3YY+EYPBX+Unt=zbCCLT1-qaCmOmF5VwG1qOK7v_yFzoA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] gpio: tps65219: Add support for varying
 gpio/offset values
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi, andreas@kemnade.info, 
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, 
	linus.walleij@linaro.org, brgl@bgdev.pl, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: m-leonard@ti.com, jsava@criticallink.com, 
	Praneeth Bajjuri <praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 12:41=E2=80=AFPM Jonathan Cormier
<jcormier@criticallink.com> wrote:
>

>
> Note: Its unclear to me, why Jerome Neanne and I weren't included in
> this patch set, considering we were the ones who authored and submitted
> this driver.

I see Jerome's email is dead. So that's one mystery solved.



--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

