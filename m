Return-Path: <linux-omap+bounces-4900-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB29C4F49A
	for <lists+linux-omap@lfdr.de>; Tue, 11 Nov 2025 18:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11EC71888480
	for <lists+linux-omap@lfdr.de>; Tue, 11 Nov 2025 17:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94483A79CD;
	Tue, 11 Nov 2025 17:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3oz7lA5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7370B3A79B4
	for <linux-omap@vger.kernel.org>; Tue, 11 Nov 2025 17:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762882634; cv=none; b=tXnMaleoLbghE8hTlh8AZxNX9EI1fJFzyuwydOu/Exr2A4m5ZCN+SGqxZZZpcbXhBKds/Z9JegiBrMGeKGXhqGVN6WBoKqRn+LTSJBxJp0QBZ7i2OPvm8+UBCzBUM+SNPg1XCwxN6qmyihUmwIFuOeYbA1z+tsxyp3qoUcFmHNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762882634; c=relaxed/simple;
	bh=EvsqPPFe0oeSUmlgAw3dm0536WHrkhiXIamVRC7y0qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rk1Xb+ECyOVvXHJk3KsBtAcISJjqwNUUtkPaylFZrRAclMnyU/DIDdNgWgQr2euIJNdNZ46Lj/fPMRDzmxwINZD/aU3PKzhJUHKRp8tF/8S+epvFjFtu+DENVWPeUAzgNi4BLPJxIOHamVk5HQuvN9HOplcvXBw2WRHQpUyFhY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3oz7lA5; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-787eb2d86bfso26987817b3.2
        for <linux-omap@vger.kernel.org>; Tue, 11 Nov 2025 09:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762882629; x=1763487429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LKCHaTU9AqqSilVdSEk0nqYpEpb/jCCe95SCGOIIGQ=;
        b=A3oz7lA5twyw0E1kVLDFiJS7dbLpY7Th1fblmNr84kkr0/+5TGO1zFPAbcU5Qd2cyM
         x74vpEPEu7DoQmAFlFfpQim4orULRoR5IAoD/Tj901CBe7FR13ix+n8RKqTA9S7lCOBR
         99qS6J9GUXum4JHlUKkf5hjxxOu2xhk36GuTmdVrkWjcyJQLsQGeqGzZ9muPRcAAJ8jH
         ZEf4yfTix3SqNI/E+fuiYdRjPcBpSEIoBiHVmEzpwOefmy0B4euMkIdMD1YZp/l7J20u
         D48ntADN+IHsGTG0ii3PHbzhv3Cn2oC3aNOVWB+6bGYno5yXOAk4u7edWHQ+wGDnnnwR
         fM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762882629; x=1763487429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8LKCHaTU9AqqSilVdSEk0nqYpEpb/jCCe95SCGOIIGQ=;
        b=v8uaAgajj5w7cCmOJF+cFm36Bdu6JHg+z0brpniZk5U0nlBuRUAn4/uuqwMExIJMG0
         Ftq/nt3YdSPO0c9jShq/SGtutlT+uEL8vr5Uk7X9gOtmkny89auZaF9VwTNAnRClQwNr
         JZbZfU2HBCRCw5jEyilXu4Kore5L7FVrrlwt1h6QJPcYE8+zaOxXuita+qdcgce2nlQk
         w4SuLrAexfRoTJ1PL0/KBIWsNraKHpL/G2dVtXdpBiSKPLho/EA6vNq6xE9bmtWRmbv9
         +u1H52ZB6uDOoh5aAeWvXMpRWBjswfr/wVaEWsP1JqA5gMFv7yhdVues9idVrX59dvhJ
         dYtA==
X-Forwarded-Encrypted: i=1; AJvYcCUr0xQktuABu6oQ+SEt/zLRv1hhh2iiiRtoOvBFFIpXz96rfuLHWvZjuJZQNva7Eb6+KCBPCaPqFYuf@vger.kernel.org
X-Gm-Message-State: AOJu0YyGrY41/79BL6pJdPnT2FbqmM/RxH1+WvsZfd3+NoPMZ2gyMOBp
	xhoMYyykvukLK1c3HQ6jo3SmukM/j4PZvKULdh3amzr6c3WxHSaqvU7Bjr0Bir2QobQ93FRS/wg
	JV+X12lCQiPZqabDtAzVJdA54FXmJ9Xi34+82n2nRnJ2pxFCSCSVu
X-Gm-Gg: ASbGncvqKDfb3qCKrdniJvfr+aLyRtHDJuM4rlMP55iKR4J2PtmC65GHZvOy/9AH6f/
	v0t4617gLwBViBe/zMVszuewq0pNTNDCkw+D9tTWCnRq5ieB0cWL6B9IaDA7Gh+t7Lw7OIpdOQR
	HAy3rhv8eJIUoXdfLXoYpuja7hjskR1onpadBqHGDy/j0//SsNCqE5S2y1fIKk58qFy8JtvFLXb
	9MoEmE4/wJAI7uNVf2XQTXddZay0jfAfax3KXnCGSHBpK4nhjWEVId3oefXdVC9pdb3SSO1
X-Google-Smtp-Source: AGHT+IH2f3XqezxeAhdNiKVObMgHBbdajDoMt0Uzx41msTtJ4/Cc2g0V2tOxLNTPJCJid1luqYuD5eKp8Mt/296kpes=
X-Received: by 2002:a05:690c:c349:b0:784:80c9:a4f8 with SMTP id
 00721157ae682-787d534ffe1mr94850237b3.6.1762882629298; Tue, 11 Nov 2025
 09:37:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107141907.229119-1-marco.crivellari@suse.com>
In-Reply-To: <20251107141907.229119-1-marco.crivellari@suse.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Nov 2025 18:36:33 +0100
X-Gm-Features: AWmQ_blId-hdIdA29G_YqWQ_lxGPlkPRdUq8v9Z8X8IVcdr2EYee2EAYY4IIHQM
Message-ID: <CAPDyKFqpiWuJs3fZkATnfPejmqL=Ei4x1U9QbuaykuZxca9f4Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: omap: add WQ_PERCPU to alloc_workqueue users
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Nov 2025 at 15:19, Marco Crivellari <marco.crivellari@suse.com> w=
rote:
>
> Currently if a user enqueues a work item using schedule_delayed_work() th=
e
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
>
> alloc_workqueue() treats all queues as per-CPU by default, while unbound
> workqueues must opt-in via WQ_UNBOUND.
>
> This default is suboptimal: most workloads benefit from unbound queues,
> allowing the scheduler to place worker threads where they=E2=80=99re need=
ed and
> reducing noise when CPUs are isolated.
>
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
>
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>
> This change adds a new WQ_PERCPU flag to explicitly request
> alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
>
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn=E2=80=99t explicitly specify WQ_U=
NBOUND
> must now use WQ_PERCPU.
>
> Once migration is complete, WQ_UNBOUND can be removed and unbound will
> become the implicit default.
>
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/omap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
> index 52ac3f128a1c..4a13111e1698 100644
> --- a/drivers/mmc/host/omap.c
> +++ b/drivers/mmc/host/omap.c
> @@ -1477,7 +1477,7 @@ static int mmc_omap_probe(struct platform_device *p=
dev)
>         host->nr_slots =3D pdata->nr_slots;
>         host->reg_shift =3D (mmc_omap7xx() ? 1 : 2);
>
> -       host->mmc_omap_wq =3D alloc_workqueue("mmc_omap", 0, 0);
> +       host->mmc_omap_wq =3D alloc_workqueue("mmc_omap", WQ_PERCPU, 0);
>         if (!host->mmc_omap_wq) {
>                 ret =3D -ENOMEM;
>                 goto err_plat_cleanup;
> --
> 2.51.1
>

