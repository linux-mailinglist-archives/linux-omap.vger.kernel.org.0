Return-Path: <linux-omap+bounces-4699-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C34EBECC69
	for <lists+linux-omap@lfdr.de>; Sat, 18 Oct 2025 11:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15F131A659FE
	for <lists+linux-omap@lfdr.de>; Sat, 18 Oct 2025 09:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA5928D8DF;
	Sat, 18 Oct 2025 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKguXYCC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB322571C2
	for <linux-omap@vger.kernel.org>; Sat, 18 Oct 2025 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760779373; cv=none; b=uI6W/mdlHT9J1JiL3UCHux+U1iebp3ZNopDvZx8PDYKlivtPrNyd7TP0kwr4GkC/biKqeVSlTRkSv5F+dLPyip4edvBxSs4y+rUGjaGmMeaHnjr/DMIyhXt3mcZ00cEHabY/RIaG28b3PekYXlUDkockUkmx9c7p1DvK6MzonM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760779373; c=relaxed/simple;
	bh=TaNfOnzJ37bdn5EXfdLd2aTU48YjWL9W2O/pFm741og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhNIrr3q0oVQroCnwosmHKCzoVEVds0uyvzj3cjrFc4CTwRapikHjvPghcxpcwuj1NSa9i1G4RKoQBXEZc2OmjGGSFYN5yEjvHipmEfPa/eiHsfxsYhdNKdTIRTGGOIUQDjiSKEZnTZ8S8wgZnDIMYwl94RLrx7z+CQgCU25orQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKguXYCC; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63c3c7d3d53so1939068a12.2
        for <linux-omap@vger.kernel.org>; Sat, 18 Oct 2025 02:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760779370; x=1761384170; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TurObsZFmrfjBqIYEt3cBVpmlVp4mzQxFn3YwyTBUP0=;
        b=bKguXYCCOLX+jMX4AR6a2vfDNmZIPJ2zHZMW+NdflzXyraDI4hat8pQl6iz8Qo6zn1
         4Js2W7/9eUFXNeJ8vpejEMyRClMU/p6cGV2kDS1c4yZ3JvFF4OA5zVnFu01fRrdehSwk
         g+B3Aodl5STcsGIey0S4+ZipJtvt1eGlhDbIKqFHhepwahAIzhkQ9qPzpXYA/14olhPO
         RPpSDaeeX4F2TJdSzU8pF6pKKUKHQaoUk/SG03V1kz3bT7WTvqnbbi4dpLdcO6/gVRPj
         P1vaYIkcG/jQ7FP6+YCTiet2l8ip3mwatkbNSAfg529LoAdPdD2cZElDx0IsY8qPqmdx
         aeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760779370; x=1761384170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TurObsZFmrfjBqIYEt3cBVpmlVp4mzQxFn3YwyTBUP0=;
        b=FtRyirTmCG+u1qoxwcQQbXtj1raKvs9+jmIgzqUr2iyIfATHOPY0lEA+sGfBiJkv3t
         ENjpzWu2wnx4hMQ38smPrdR18q8XTGbyGGQfyxldl8XQmPczCKR5uzX0r54u+47NEw5t
         GQJ3OyDGggjLNnTYqisPyGkGpk6bQnh+X4/kGjK8DG0CiuLmj8vHCmeCKtIeqZ1ZfzzP
         4DPFuEnIxjs+NN4NFV+qJLGYPUuNnlj6VThfHzdkA7+4XVn7YRXcCIetI8WYe0NtYkWw
         aJb0NfxEMueLoMfKhh6BJ9hb09Lx1P8XUezco5wsAea75tVeb5GNrBECVZYZ/bfm5H19
         99Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWoClwCuehMWfXnzhPRaoJGkR/L90Hzjzwl8Xj2zq0G7xoD0yLl30PUGY64ipD9h9zpbBQFtvatisBp@vger.kernel.org
X-Gm-Message-State: AOJu0YySZOxeosrTuZ7W6/pFwKZA7SOH/QBM1IN1Cri1dNkPceoJQ5R5
	TeDILrJgSMYahbgUgiBIuOHzLXlZyADyVMawRkcxdhZ1q660pfdme74tY9Y0pon2OXHNyihQUyd
	ewJOpO/h74our5lfXypfB9LoCwlZvPaM=
X-Gm-Gg: ASbGnct+Wg74y8MUKqM8oIQHxdVZQd0fi7ObatPdCvVQvyDEfueWlZadyBxRDEKeNUS
	RZNfTpYWpknVJ0eTQxlkEyoYb/lK7It6b8QQNgHgpipCfAMyIrrzu5s0rQK2/2Px+YgE9yuUqlq
	+LYmgrIdUgE9Y0JpmhBx9jlHeV33V1vBIqVhIIbUlQErenWxF8mJVNEBh576K0etgm7gOTxMsKM
	UyOpCoCLMAhAMZAA4ySnwgs8srkp1reKkLT2jU0rmCcdSIvhuDbK/m5DQKjZXcG13nmkg==
X-Google-Smtp-Source: AGHT+IHw19pBZ9IqmqMp9HxxNmCsj695WdYgJZRejOrWZTvR3/bpEeF5am+muoYu9/EE8QnKVNq6O32MbmibLE6n32Q=
X-Received: by 2002:a05:6402:d09:b0:633:7b1e:9aa3 with SMTP id
 4fb4d7f45d1cf-63c1f6f6269mr5785386a12.34.1760779370419; Sat, 18 Oct 2025
 02:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014113234.44418-2-linux.amoon@gmail.com> <a2cefc72-de44-4a23-92d2-44b58c8c13fe@web.de>
In-Reply-To: <a2cefc72-de44-4a23-92d2-44b58c8c13fe@web.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 18 Oct 2025 14:52:34 +0530
X-Gm-Features: AS18NWDbaJ8hdNv-j0Yxl1ICNkckxlgqQRK21f2Q02tESiNZuDiGqp2OynZDz4k
Message-ID: <CANAwSgTtaAtCxtF+DGS-Ay4O3_9JMwk-fJ27yoijhWWbF2URrg@mail.gmail.com>
Subject: Re: [PATCH 1/3] PCI: j721e: Propagate dev_err_probe return value
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-pci@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

Thanks for the review comments.
On Sat, 18 Oct 2025 at 14:26, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > Ensure that the return value from dev_err_probe() is consistently assigned
> > back to ret in all error paths within j721e_pcie_probe(). This ensures
> > the original error code are propagation for debugging.
>
> I find the change description improvable.
>
Ok, I will update this once I get some more feedback on the changes.

>
> I propose to take another source code transformation approach better into account.
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/base/core.c#L5031-L5075
>
> Example:
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/pci/controller/cadence/pci-j721e.c#L444-L636
>
>         ret = dev_err_probe(dev, cdns_pcie_init_phy(dev, cdns_pcie), "Failed to init phy\n");
>         if (ret)
>                 goto err_get_sync;
>
No, the correct code ensures that dev_err_probe() is only called when
an actual error
has occurred, providing a clear and accurate log entry. For deferred
probe (-EPROBE_DEFER),
it will correctly log at a debug level, as intended for that scenario.
For other errors,
it will provide a standard error message.
>
> How do you think about to achieve such a source code variant also with the help of
> the semantic patch language (Coccinelle software)?
I do not have any idea about this.
>
> Regards,
> Markus
Thanks
-Anand

