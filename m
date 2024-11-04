Return-Path: <linux-omap+bounces-2571-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5773B9BBD58
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2024 19:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C6A328278A
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2024 18:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8141CB9F6;
	Mon,  4 Nov 2024 18:35:29 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CB018BC37
	for <linux-omap@vger.kernel.org>; Mon,  4 Nov 2024 18:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730745329; cv=none; b=bmns2gAmDE+GAyqEi5kdLewDBDETPdj1cHdMlAgwNV17AXE13ZT2qsjocc77syKpKOfPT4qV+RJmgB1wbM7xuT1npDXETndrbyAhqbYD+bCuEJUbSQMZLJ2vM8vv27LAxtwt9I/g6oK3ox3z+E4MrMByJ/gHPI0FQqe1purORkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730745329; c=relaxed/simple;
	bh=0q8JDwWzDntd/aeV9gPiXXtsjosur55lq2xvMgVntdk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LMvS+6Qc/THRVwqUPZ/4oQb9gHAsIWM0bblMdtKrAGRdz9k1CX6mMMU+MmTZJvVR7CyPSBsvkgs417S8+IZJt6JEoIKKyr9QTVkrjzlSLp8hojLv8PmVl+50uxkUgjWGwUGwpNnR7er+Uvopr66hfXO2tnzknK437sgkl5RYQIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-720c286bcd6so3568005b3a.3
        for <linux-omap@vger.kernel.org>; Mon, 04 Nov 2024 10:35:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730745327; x=1731350127;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5psdNGZt7yO/EGDxsF0O7Dn6TNWS1865Oba3g5L+Z4=;
        b=P9l9sHXCOk5hAJiq0kHxzamPFhy7Y2XGLHYZz1RjR7U6P8yQE096RoZUUgjYPfnwFm
         1WBS5tbD2XLFKi2sENOdizscIV1twyhz/dLWVfGRJqm/sZhmjSICOfwm6J/uaRZxwKu1
         iXkVUmDBWYmnbSYN0Sito9AK9z3MV4ZzA4DkAdql5PGcmmdzQsD0jNXhw2YaVau04VWr
         JWmE11+dSOrd4X8xSzXYX3nGkHT016uj1mwI2cV/DaFbJ83vZ81iPy8N5hN2k5Z1kXxV
         rW1oTV/NVvLMiWsEG5U/sSm76PbhzyhSVBTX9J10pW3RPlf20W72+QbXCamcJ4SZCCHJ
         HdzA==
X-Forwarded-Encrypted: i=1; AJvYcCVY5YH5Jb1ez7UIWkURNA+Bq3Odung4n2WJW81QebZlWIeFmR6tc5H389u08qenPcTs8uMuVxOgNxfG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx82elnWr3PcBx2+gM/JwBqjOf9XftcgKD5piKQqOM2cErtUAxr
	d3QeJKpInBRQrlwOqeiBE8WN+rSjWFbA4jxBf2IbKBtJ02bucomQfFya08sCF9c=
X-Google-Smtp-Source: AGHT+IFdG0hVRz4dPBfiFMJhFlY8swzM18DsMZV8IwIUprVfLFdN6Gv/FIxkJZSrzjoyHAC39n6arw==
X-Received: by 2002:a05:6a20:4389:b0:1d8:a3ab:720b with SMTP id adf61e73a8af0-1d9a83aeab7mr46788718637.9.1730745327258;
        Mon, 04 Nov 2024 10:35:27 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee45a0eae9sm7369576a12.84.2024.11.04.10.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 10:35:26 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>, rafael@kernel.org,
 viresh.kumar@linaro.org, zhipeng.wang_1@nxp.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>, stable@vger.kernel.org
Subject: Re: [PATCH] cpufreq: fix using cpufreq-dt as module
In-Reply-To: <20241103210251.762050-1-andreas@kemnade.info>
References: <20241103210251.762050-1-andreas@kemnade.info>
Date: Mon, 04 Nov 2024 10:35:26 -0800
Message-ID: <7httcmonip.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Kemnade <andreas@kemnade.info> writes:

> E.g. omap2plus_defconfig compiles cpufreq-dt as module. As there is no
> module alias nor a module_init(), cpufreq-dt-platdev will not be used and
> therefore on several omap platforms there is no cpufreq.
>
> Enforce builtin compile of cpufreq-dt-platdev to make it effective.
>
> Fixes: 3b062a086984 ("cpufreq: dt-platdev: Support building as module")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

I'd much rather see this fixed to work as a module.  You already hinted
at the right way to do that, so please do that instead.

Kevin

