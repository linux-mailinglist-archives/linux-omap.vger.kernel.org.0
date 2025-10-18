Return-Path: <linux-omap+bounces-4703-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CCCBECCEF
	for <lists+linux-omap@lfdr.de>; Sat, 18 Oct 2025 11:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E00162284C
	for <lists+linux-omap@lfdr.de>; Sat, 18 Oct 2025 09:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350212D8793;
	Sat, 18 Oct 2025 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RzQcs3IZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3651C2868A6
	for <linux-omap@vger.kernel.org>; Sat, 18 Oct 2025 09:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760781210; cv=none; b=qedlUeQ1p8bK98lhbYt2xclAnfwRjCc2Y3s/PDC3n1GKinVX7RSAUmxqmV53cw0JdbyGo3MZTh5adugsJMYaDBFSWMEApcrYYakvG+qt9/rpZaG9oUliCX5cCMQLz73iICetU/cgwD0QmHMfKUloB34Zyqh3IbIwAR+BDgiGtqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760781210; c=relaxed/simple;
	bh=jLj8RoSgzmMT2RBpQP/RNNqIQpG4p47ETDS+XypecR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEJCh9GEpZS1hvCdw4NkTAcsikq3BuT6SHEzpJJHBuRkgwJsgqNH8aL0OB7adT0d4+uSynJLPzm4MgpYYy7eQpC0Xv7FSvxP3anPI5TF0Pa8WriK1HOD5iF8uikKASRTsIw3BE3M17Io/7/pn6rU5Zvsu/ly7UVO8E8Qwrc4jno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RzQcs3IZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4711f156326so12968215e9.1
        for <linux-omap@vger.kernel.org>; Sat, 18 Oct 2025 02:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760781207; x=1761386007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YLcttbn5k16RAKKI+EzOZF6EXsPtXzfzb9zD7Ffua0E=;
        b=RzQcs3IZNLzsYNNaFFLWAojQdcRTdALXC5Y1Lwt376bv5iIP62cOMiMGGGiZYL8pPL
         Fks9AwNGse1GdPZ3Um96cYML4qU5NpRq0aY/HEt6skDmm5iyoGUt2yclyGyKHgr0Prmm
         yP0f78bLLIZaJvMmxQNWA+aXRdAe+LJq7cyKYCdHpZq4/chHidZF5uqyFwnTOCd1Q6qA
         SHXNTQwXpmcRefdbnuewarZlwKZbxxNlA2ZcYZr/7NwfH0udfkrzBybF4LtAOZ+EXXKr
         lVgEe1t/44XdB+35G4nWz5jqjUocXfoGWpRik+54ot5eZPCPNBnxCy/lezPPlSaxQelT
         Je3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760781207; x=1761386007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLcttbn5k16RAKKI+EzOZF6EXsPtXzfzb9zD7Ffua0E=;
        b=IV8EPgK0+NDKu/ZksXqyHcYcigDvdlGYPnGP5OpV9aD+Wt//YTPhmCKwl45nAkadks
         4xPfAaoDced6llq603o6jku+6Fhb+tEH+cFINtE++563mXITI18/m81mYQ3UHJDdImvM
         Uy155mTqT/juljTYAEg78ivfkSCPebwTEiAaVuM1A3AQQwK0B7J1iEbbxFLr9Uv1YBn4
         Ox/7GXTf+MJ1bruH+vmWvVDHZ64pOv4OVcqTsr+48dXb8IfZuNbVTAXwesqH0Lh7DBag
         c5fQwo29aNnoJ9B/9NxGmhwwUpm4omXaUzUNlMMv2dWc22Exg2JCHXTITicYhE7Q2KOQ
         Du4w==
X-Forwarded-Encrypted: i=1; AJvYcCU4R5xIh8jTIdaDTCYwzWaiCT8VSSsX00ebE17Obgt3yhuNPVzPIi1UcUF0fmUn5xzH5noF/2x2Xw1D@vger.kernel.org
X-Gm-Message-State: AOJu0YxxSRPc/wIlURKoC0j13/M7uVtTpgwsndw8jo0+r07rjlGsOSMW
	WfRKEqUSA3MwoLsogfy9Ue3w7ezOWkcO9EJTU/hmii8nYvs/rNX356KMKiFf3yWyFV8=
X-Gm-Gg: ASbGncvR/vK2amitthJDpcOUILhMj8imbx3rRxX1b35DTUILVt8w3xM93k1TebKocT7
	Sors7dOKrK+Ns2ur7aAucYcsR0Z+7iK/PD9ZH4oVn5dGbps9kAsUkDpaDvyQkvU3WuVi3N/WfzH
	Uy8mfXSiZgz1RpuX0Z95igMUCjxSDdzda2EwZTmRV5hPbOu/uBQTsk05+nq0D+b0cJYG1pszDTV
	YfmXR3ZbFy0e4eY7kgK0kiYUorPZxs+S4JhSoZH2bGoBNUF6V2j4sEh0KyHF1egEVkH+ViajwNo
	0+wzxLT9D2ybyXT4RWF8hcim7U0Q1ahBsBnHSaEfney3UQvR6G6EU5Tupc/K7fDlCR3ohyxVA4H
	rmI19vheoFenYKcLftJR3kZDf/BgTLlana1ZkonNS0bW/CxwL5LNcmpj0SbhOjPxXerLrZck4+c
	cnqrFLSP+izQeQe8re
X-Google-Smtp-Source: AGHT+IE7qvTI/bg1JlFoj/mWNWosxLYB/3XVkN4l0hbhMw4Lq63sfmg28D78UCq3lmimATW7krx+qA==
X-Received: by 2002:a05:600c:34d0:b0:471:1717:409 with SMTP id 5b1f17b1804b1-471179071b4mr45155315e9.23.1760781207332;
        Sat, 18 Oct 2025 02:53:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a96asm4030365f8f.31.2025.10.18.02.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 02:53:26 -0700 (PDT)
Date: Sat, 18 Oct 2025 12:53:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>,
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/3] PCI: j721e: Use devm_clk_get_optional_enabled()
 to get the clock
Message-ID: <aPNjkzrexmIyQXpT@stanley.mountain>
References: <20251014113234.44418-1-linux.amoon@gmail.com>
 <20251014113234.44418-3-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014113234.44418-3-linux.amoon@gmail.com>

On Tue, Oct 14, 2025 at 05:02:28PM +0530, Anand Moon wrote:
> @@ -630,7 +622,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>  
>  		ret = cdns_pcie_host_setup(rc);
>  		if (ret < 0) {
> -			clk_disable_unprepare(pcie->refclk);
>  			goto err_pcie_setup;
>  		}

This will introduce a checkpatch warning with checkpatch.pl -f because
you need to delete the curly braces.

regards,
dan carpenter


