Return-Path: <linux-omap+bounces-4805-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E1AC16045
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 18:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F4F04E8BF0
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 17:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45CF347FE3;
	Tue, 28 Oct 2025 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQADYmtS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9933928FFFB
	for <linux-omap@vger.kernel.org>; Tue, 28 Oct 2025 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670849; cv=none; b=VgU4VidCZCE5ubavSeVOuVFGoYV8J9gSQrme+ZHTRKPcCBgZd42pBVOtKzsNtcldBu2QNGhmRHuL46yI71Os7IMrXSykjMu0h+RBQbxxOi/mFlDEp6HhhBSaK5ODxb/uMtd8WXO3ojYEjAcjfd4dXLASU+lIySxQVzhXQzNDbHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670849; c=relaxed/simple;
	bh=bpUk9F39KUAATEaB039lzBYbcAFRUIrSvmGDpez1vQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d5iVOADYcOCFLndVX6QAdcK8C5KXtvsCl0QEhcAdRXeVBe4m3bUVEc2nbi5Xd4hGlzbPZzkClcSbN+ZdF+xH/6el90m8+wfQJqA+hCWqp8+xv6TrN2zApItWC994K7M5qyd7pNqSasNOHI8HdY3mTp7saqP4mvXwDbtB9zXLJ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQADYmtS; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63c4b41b38cso13290037a12.3
        for <linux-omap@vger.kernel.org>; Tue, 28 Oct 2025 10:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670846; x=1762275646; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pOzc7xIWO2p+WR3VIGi7nTgvTnzL1L1uYDvVNto7C1I=;
        b=AQADYmtSjOCbALT9FWQo3AUc55GYkNyiv8gNnTqbnlJOGhO+biyimzpgceekt2XZ9T
         JOOxA+nNQwFK/wRLMOgxMUh3qy+u1s2PWwSW5ATMi3e9WhZpD/obEgpcRvO1Uk+9lQKW
         XyNVhbIxNCANLSzILBhBD08XOYDi7IaO1TxJpjxgeVaiuydqTVSxhmZaeVgqVDVRengq
         wJLDMIlvp2S0dw8Bt8sjUV192kUfbItj4Ui5ASvStmJ3WsXkSnCn8q1lOlmeGPGfhKp8
         hASj/jyv1BobiKyUp9mJJEy2krpX04FAI/YHbxwgSFKXo+cYabHylqTfWnPdz7rueP9w
         /rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670846; x=1762275646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOzc7xIWO2p+WR3VIGi7nTgvTnzL1L1uYDvVNto7C1I=;
        b=M6SdGzPg4tYIFArK/P5qx5WVv4O1nwARE10x0cZurbhMBZLKRyfsMDdeMlg7jz6Has
         VUjfzxdiumemoMKHGcGdOeF9UE9VVKlutI7BfdYkcXpkrR0DiOIzhz+ZN5an4X3oz0ni
         ztUIFSSvQudYef2FzewDIg5id8Gv8lsBE2uvFrulGw1EZhEzUXsMtngrIbRT+a40t0Kn
         lDb95vejFrnxf3VRVDSmjW9CwBhe1lebBgg4/gPjixuOwTuWbJWXQ29e7j+Wp6YOJN9E
         NpKA/M3n68Q9lYHDzDTe27K2zlPggAxVDFVtoOhqT5148IjMSz9zPSP3+rGGrEx8UtEw
         wgkg==
X-Forwarded-Encrypted: i=1; AJvYcCWJYuler5bK48Lh2AQ/XJq+iYI7T76Xn6aoPG9oaQbKHdAFOP6DpqK9wl9BuDsZjw0sXCz8yUJAJHno@vger.kernel.org
X-Gm-Message-State: AOJu0YyegcepZgTQeqg/vYP1bsJpHSB7asBwJqaJbx9I/CJgzYNqlgcz
	FAWJz0fXa6EqYMO3+xhRfJ2WKgHnEygvDvDCPnR0cWE1T5oTeUWJuxOXcLpfvAhwM32atBb6vhM
	XG2lf4uWZ/n3EV6q7hv3/cQTIMerCmTc=
X-Gm-Gg: ASbGncvEPmInMHTqmClFiBRHX0sIR5MV8yBBaCP3qSjie1yD8dYvAwLjonzgA2UvWDb
	ri6QZIg+wOjJkEiBOPopCKi6BFHdMv0fypy3HCTE7EHLov3eyxleQ75leTFMLvS0VXpuJ0DlkeH
	kXgAfDrmea0Ur3QMqCNcMbdoOUBb605oli+XkwQyc0WGw8/UV+x7K6xKgzLzMGbxe8bxw3SzLz/
	LxGELZXC5dnizzqcKNFsV2CN3MkWskdI7ZFj8v9e1kjuBktAuimHgBgZeCH4fXqpMbp7g==
X-Google-Smtp-Source: AGHT+IG4YfmqHGe2pINyHg2K6LgJOKPpNmL7zajrt/SLmYhcYlyZRe1+iAEJYBHgTq7bsXU1Dyysoqylc7EnkaBl0VA=
X-Received: by 2002:a05:6402:d0b:b0:62f:337b:beed with SMTP id
 4fb4d7f45d1cf-63ed84b5cd2mr3624305a12.30.1761670845665; Tue, 28 Oct 2025
 10:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028154229.6774-1-linux.amoon@gmail.com>
In-Reply-To: <20251028154229.6774-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 28 Oct 2025 22:30:28 +0530
X-Gm-Features: AWmQ_bnnegLAH410rfGGE5Iq-GfVFIwFAd46rVhhltc96obVUpLwKbSOptU59bY
Message-ID: <CANAwSgTZOK9tdfQgVn6kZsxd6KdEuPn8ZH5-yrLqS4Np295dXw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] PCI: j721e: A couple of cleanups
To: Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Tue, 28 Oct 2025 at 21:12, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Refactor the J721e probe function to use devres helpers for resource
> management. This replaces manual clock handling with
> devm_clk_get_optional_enabled() and assigns the reset GPIO directly
> to the struct members, eliminating unnecessary local variables.
>
> These patches have been compile-tested only, as I do not have access
> to the hardware for runtime verification.
>
These changes are v4 revision. This got messed up in the format output folder
Sorry for the inconvenience.

Thanks
-Anand
> v3  : https://lore.kernel.org/all/20251027090310.38999-1-linux.amoon@gmail.com/
> v2  : https://lore.kernel.org/all/20251025074336.26743-1-linux.amoon@gmail.com/
> v1  : https://lore.kernel.org/all/20251014113234.44418-1-linux.amoon@gmail.com/
> RFC : https://lore.kernel.org/all/20251013101727.129260-1-linux.amoon@gmail.com/
>
> Changes
> v4  : Improve the commit message.
>
> v2  Drop the dev_err_probe return patch.
>     Fix small issue address issue by Dan and Markus.
> v1:
>    Add new patch for dev_err_probe return.
>    dropped unsesary clk_disable_unprepare as its handle by
>    devm_clk_get_optional_enabled.
>
> Thanks
> -Anand
>
> Anand Moon (2):
>   PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
>   PCI: j721e: Use inline reset GPIO assignment and drop local variable
>
>  drivers/pci/controller/cadence/pci-j721e.c | 33 ++++++++--------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
>
>
> base-commit: fd57572253bc356330dbe5b233c2e1d8426c66fd
> --
> 2.50.1
>

