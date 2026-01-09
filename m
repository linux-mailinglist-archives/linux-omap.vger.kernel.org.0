Return-Path: <linux-omap+bounces-5402-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C01D3D075F1
	for <lists+linux-omap@lfdr.de>; Fri, 09 Jan 2026 07:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A55B0304D35D
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jan 2026 06:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1859E3B7A8;
	Fri,  9 Jan 2026 06:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xa8IwATj"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AF0261B6D
	for <linux-omap@vger.kernel.org>; Fri,  9 Jan 2026 06:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767939479; cv=none; b=qnw+52n6t8lRcjZFzbBcw/V2aE0IPdbxF7r8PY10t2sSJNsz9jqVPQOUl17dxhfz1yxq/2Ip7wZzRhl89c4vmxoGfooehNuI04nTscorMW1GGKdkcSlLCskefIXd9uPmdnNSng42sigfHF3PkIrn+yGplXxnblT7GGL5i2I0NZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767939479; c=relaxed/simple;
	bh=CGip36cfTFvK3Lv6opdxPaeDlGHUGzEci/WJdcaiFYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oU3vE2xKuENZSSx8oaLoGWzRCs4dM9hADXlgqmfuBjqKx9NEI/K2AnHIW5Nb2+NH+qHJxu+LF9XJa+7947YuRqLnsF4q+skMvwGiAUXn5XSIutD3NKlRFrh2Q6GjUjLRDStTHrvdiTBeKasK8f5zND6c9WgrWmEhatAvcu4j/fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xa8IwATj; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29f30233d8aso28777195ad.0
        for <linux-omap@vger.kernel.org>; Thu, 08 Jan 2026 22:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767939477; x=1768544277; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B52PeAVE9EHKJJWWUizpCaS9qNQYPh2fiLhyiMX0ipI=;
        b=Xa8IwATjwIl/J2ypIxriAvcNO8SBvDQmMOk8qn/vKttzls6hRL6GmFW58npMpkerY4
         +n3K/cuCWfMEKnvf1xEdkCj9rHhBTzx1MEpMUQUCt/wpwsnipFvRiG3IfcmHE59J4H5v
         Bld1dp36mH3BcCj/ppX+PLSPlIsObk1f1KjXSlpwDjWv6Ir8auFLbU+C+3DGUrcWQj99
         xyhTnDTmzq5aCni0W0SfUqh68KwKSgNmdfcshs9uoLW5IF6jgZyQUHCf8FQSWnNidQ40
         vuQOJS96PrmOvh2uib2QCIY7qHnIPGJdw8E3t996JwH+wc0/W+LYcelb58yg3p3KeGSh
         0r+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767939477; x=1768544277;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B52PeAVE9EHKJJWWUizpCaS9qNQYPh2fiLhyiMX0ipI=;
        b=F+q9HVQhcxL9tZJ3+fA//4CuTIxHIrrTG9hJ5oFI4vwf2J/kShD0FSd5gOi2EEGQrF
         RUwe8LzqD63xAWqBsSRsR0TrkPlaYM6woxUE8HWv1C6TbvQ7PcmZmQ/A+8tstBllrGTg
         Vy9n5t+T0lppySNe1DlQKRBlcvtLaVlHv7tbIY0tA0c3KWNQG1nyJ6Y31G856ep5D7+3
         SxCG2WK1CGZJamLWeVp+ZuHsPePb+rL8rHAbOOKRIAazil2OBgWCkezGeRrV2Z1KBO77
         z2RtXvAUxMI0+JC8pte0KBHphPwFMqMdSt/XqJlFX4Ydbtumxz9foX0sHGLpaq889Aow
         zVCg==
X-Forwarded-Encrypted: i=1; AJvYcCV0s511SdZLbrSCa0urwHokuIVmsmR82vVVmZ2mjmmXeoT7a7OBFyQchqWxoTKeX95/CZvbVcAXPaAH@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk+YeYqTu6sfCEwUKcw1xXxBxXwu51YATXOAl0fIXenaaa/2MM
	6AsKE1wIrJeSJpjK9FR/vNGhADvZoTAPt9ktXepFu3zpgYqQVyIoSzeA9Sj8rplLplg=
X-Gm-Gg: AY/fxX70eomOxDKHj/Ze1r2ky+aRaKqHZFHKxkizNU4/dWQUHS5PL2S/koHgJf1bLti
	DXr7fo+eE6do9dipQ9nSqosvyjViyvyr/rQbs51BeaVlvOYXjaCGjeGPf+tH6MoyAScWjHx8DGA
	FtIiJxfenUmU8STDMWrqcCtTMu82erKlFwloHxwtZWHDR27eUDd0cn6qF3tpTlCBKmZNQK908QI
	NnkGTf1Yg3St8JwtlUCSv7uqvsR5NUHZsTEqyhLkrq/xaFoBjPfhnMrzpbzTx1qlRNiV5U2Y74p
	TpTd68ULyyDsLCfW6iYIKynLR4NJDGSL76cLWFePuMqXKlmNqlf+SgmRJqfQZomlw8+WV+ubWGc
	/PBlSrw7rwGTxnJsOupBtOnpYJMIQLwWe/zIFu48W3IZuBudxZuuto7rUIpKKRfIDLwI/RK03ad
	gcIek8kcBU+iQ=
X-Google-Smtp-Source: AGHT+IF1PUIM3YJ5c1HvljBDLvp2Yx+KSeiQZ8I5VnVq7w99w4gGuEPnNAUPEIdLuCn2hfk0/VLznQ==
X-Received: by 2002:a17:902:da82:b0:298:55c8:eb8d with SMTP id d9443c01a7336-2a3ee4b5deamr81552665ad.35.1767939477109;
        Thu, 08 Jan 2026 22:17:57 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8d76sm94621785ad.84.2026.01.08.22.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 22:17:56 -0800 (PST)
Date: Fri, 9 Jan 2026 11:47:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, 
	Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/2] cpufreq: omap: remove driver
Message-ID: <7nujuxlfep47666olk4fvd3qyitg7hkwso2oigqy3nkcrvpryg@wo7zfgczegfl>
References: <20260108-omap-cpufreq-removal-v1-0-8fe42f130f48@kemnade.info>
 <7hcy3j6ete.fsf@baylibre.com>
 <CAJZ5v0jePerpMJR8CbiMKOKmSV6f7BLc0ZO6wTQztLvw9Sj3PQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jePerpMJR8CbiMKOKmSV6f7BLc0ZO6wTQztLvw9Sj3PQ@mail.gmail.com>

On 08-01-26, 21:28, Rafael J. Wysocki wrote:
> On Thu, Jan 8, 2026 at 9:16 PM Kevin Hilman <khilman@baylibre.com> wrote:
> >
> > Andreas Kemnade <andreas@kemnade.info> writes:
> >
> > > The driver is not useable since 10 years, and the affected
> > > platforms have alternative drivers, so remove it.
> > >
> > > To: Rafael J. Wysocki <rafael@kernel.org>
> > > To: Viresh Kumar <viresh.kumar@linaro.org>
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: linux-pm@vger.kernel.org
> > > Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> > > Cc: Andreas Kemnade <andreas@kemnade.info>
> > > Cc: Kevin Hilman <khilman@baylibre.com>
> > > Cc: Roger Quadros <rogerq@kernel.org>
> > > Cc: Tony Lindgren <tony@atomide.com>
> > > Cc: linux-omap@vger.kernel.org
> > >
> > > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> >
> > Acked-by: Kevin Hilman <khilman@baylibre.com>
> >
> > Viresh, this is/was technically maintained by me, but feel free to take
> > this via your tree, or let me know if you want me to queue it up.
> 
> No need to bother Viresh with this, I've just applied it as 6.20 material.

Thanks Rafael.

-- 
viresh

