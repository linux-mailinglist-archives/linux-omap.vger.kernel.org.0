Return-Path: <linux-omap+bounces-2238-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B1984638
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 14:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE396B225AE
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 12:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD5B1A76D2;
	Tue, 24 Sep 2024 12:51:56 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B573915575C;
	Tue, 24 Sep 2024 12:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727182316; cv=none; b=foLdzE/vNvj8VSuSLuso05bIWbKowheNAz8oJOU+QwcdwmEpq9J0zmxTJPhkgKgKzOIoX92YNQV4Ew8fjFEnk4judWTySZ8+Hry9PWbWqr6ubACkvBGMZhNLpfcSYZQt2RlYUomcXyaH4XAlZPf2vGwUb2ZBYSBjh9JULD8v+MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727182316; c=relaxed/simple;
	bh=cD8IxaVvcleQuLilb+BNWW9ETD7WdzS3SafPfZzXuDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ff5EZldwjzyK+8Moe1k2os6MtFj0k68YSB4G3mo3k8SbTpDsguWhf58JUjS5R0QC73kMSeFMH5LL5u8uJXOZdi7Xmhulls0S0rbDgWjOEV8pj/NKGCLy+ESG3VD40myp9cOmvxYyzs9wbQ2geUy6+rTu9/8FoGBINx6qYevzS7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6d9f65f9e3eso47037697b3.3;
        Tue, 24 Sep 2024 05:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727182312; x=1727787112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/3jKyfmwO65q+y2au20KYXxvu6qgkeXHynV8svPwl8=;
        b=xQBfjrxx0pHipGdojix0Ql2xH7EcgEKo6nVX7W70ITJzFpdKTX1XEkCkQ4X/45z+QO
         izgLKEvIZC6OhQvzJTgPq3Y3jyN5ll3E9SXxRjexESKgEsygDcbZbfeMrqa2VwZGINNm
         TRCp10xzQ4IlALMlt/5Ug2kfnS4VVAXIqNd5j/ygeghh96tUakeObLIadxcnyY0FNHHo
         QGe+HEJeer3MTV+aajtzySKxkrZ46DwjQvOikm0ZnEB0gwxSU6z/7TFPUzFYoHVekMff
         r/nh/xi+f1hKhVlwrerTMvNo1wpoX+jHJftGH5+NtuqgF3hEThWFe1NqzLNPUlJ5j1kd
         MUTA==
X-Forwarded-Encrypted: i=1; AJvYcCUuya2gmKVabv+IxL62wbZNFmaF3o15qMdG67sUYiN1+eHGFwW694O2gFk6psz6YoJHMfJQagliIlr0Srg=@vger.kernel.org, AJvYcCVlXOrr3h79Fcj0/nZlFTYFpqmoHWe+54dLt23/C8T04JBTPthfsoQNHMbjvvCY7b/CnhEbnKxxf7p/Bw==@vger.kernel.org, AJvYcCW9zBHjGYkvfbSco6khsR9lqORFYYurLtS9CcQp1wOK6CvvUmzzkup8FXfbbrytEt9B8Bfhywba@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkeo+MimypzRIf7Eh2Wniup0wOrSyLuklaY/+Aim8cmWJbZLj+
	opk9T7e2zsqaooamNDBtrXmHT/2CBpzrLj6cP7/91Spxem3ZgwEpyW7ZLwuN
X-Google-Smtp-Source: AGHT+IEjOTqYv2UyMSPlun2rXVffZOoSRXvnDLG0/En2mX1z24hgZEY4XIjoaHfz3KIeXfrJ4kptvA==
X-Received: by 2002:a05:690c:112:b0:6e2:5a8:3447 with SMTP id 00721157ae682-6e205a8372fmr36690697b3.26.1727182312258;
        Tue, 24 Sep 2024 05:51:52 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e20d03d50bsm2319197b3.33.2024.09.24.05.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 05:51:51 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e1d22ecf2a6so4808722276.1;
        Tue, 24 Sep 2024 05:51:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEZeC5rTyiYfwaMXEAA6Tdb1xiF9ipXs4h+vyhwl9FRN8lfVrTlN04x8xcG3yfPVLsXqmZNmTT@vger.kernel.org, AJvYcCVigC7p8KEl0K8jOD/lssNnNjMXM9Mo2z7gBwF/oGux9szI7gu2oPr0V8MWoy0QA7HgAngckrXR6+FzWmo=@vger.kernel.org, AJvYcCXv9Pqrp05KNDWJtKjDXTw8bkQ8hO3IBrId7/kge44eMJiQG3rzt5/zIpZiz0+jGV0V1jFMjr322qEeYQ==@vger.kernel.org
X-Received: by 2002:a05:690c:4a01:b0:6c7:a120:e0ec with SMTP id
 00721157ae682-6dfeed59583mr124752417b3.22.1727182310282; Tue, 24 Sep 2024
 05:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240924-am65-cpsw-multi-rx-fix-v1-1-0ca3fa9a1398@kernel.org>
In-Reply-To: <20240924-am65-cpsw-multi-rx-fix-v1-1-0ca3fa9a1398@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Sep 2024 14:51:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXheHYREMgw5D1-djMg_oa2KK9vf-GfTtW52Pd0uPz7dA@mail.gmail.com>
Message-ID: <CAMuHMdXheHYREMgw5D1-djMg_oa2KK9vf-GfTtW52Pd0uPz7dA@mail.gmail.com>
Subject: Re: [PATCH net] net: ethernet: ti: cpsw_ale: Fix warning on some platforms
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, srk@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 2:29=E2=80=AFPM Roger Quadros <rogerq@kernel.org> w=
rote:
> The number of register fields cannot be assumed to be ALE_FIELDS_MAX
> as some platforms can have lesser fields.
>
> Solve this by embedding the actual number of fields available
> in platform data and use that instead of ALE_FIELDS_MAX.
>
> Gets rid of the below warning on BeagleBone Black
>
> [    1.007735] WARNING: CPU: 0 PID: 33 at drivers/base/regmap/regmap.c:12=
08 regmap_field_init+0x88/0x9c
> [    1.007802] invalid empty mask defined
> [    1.007812] Modules linked in:
> [    1.007842] CPU: 0 UID: 0 PID: 33 Comm: kworker/u4:3 Not tainted 6.11.=
0-01459-g508403ab7b74-dirty #840
> [    1.007867] Hardware name: Generic AM33XX (Flattened Device Tree)
> [    1.007890] Workqueue: events_unbound deferred_probe_work_func
> [    1.007935] Call trace:
> [    1.007957]  unwind_backtrace from show_stack+0x10/0x14
> [    1.007999]  show_stack from dump_stack_lvl+0x50/0x64
> [    1.008033]  dump_stack_lvl from __warn+0x70/0x124
> [    1.008077]  __warn from warn_slowpath_fmt+0x194/0x1a8
> [    1.008113]  warn_slowpath_fmt from regmap_field_init+0x88/0x9c
> [    1.008154]  regmap_field_init from devm_regmap_field_alloc+0x48/0x64
> [    1.008193]  devm_regmap_field_alloc from cpsw_ale_create+0xfc/0x320
> [    1.008251]  cpsw_ale_create from cpsw_init_common+0x214/0x354
> [    1.008286]  cpsw_init_common from cpsw_probe+0x4ac/0xb88
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/netdev/CAMuHMdUf-tKRDzkz2_m8qdFTFutefddU0=
NTratVrEjRTzA3yQQ@mail.gmail.com/
> Fixes: 11cbcfeaa79e ("net: ethernet: ti: cpsw_ale: use regfields for numb=
er of Entries and Policers")
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

