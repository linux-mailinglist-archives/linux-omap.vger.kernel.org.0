Return-Path: <linux-omap+bounces-4800-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7E3C133D6
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 08:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 970DB1AA013C
	for <lists+linux-omap@lfdr.de>; Tue, 28 Oct 2025 07:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704822C3248;
	Tue, 28 Oct 2025 07:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzwFJfSV"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7932C0293
	for <linux-omap@vger.kernel.org>; Tue, 28 Oct 2025 07:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761635221; cv=none; b=BbFBG/OWv291y4vk7e9/IzDcvUPjXbP+w5RqH8Ka8wrV3yn/L4F8FrmS6NkFz8Cw2uNoSBtUzJV2TyX36Bnqu0PAwNy9y1qb3MEh8JSdS+SlPaQSm6CDD6X2KpDncfbhjA3GRYrzEclG2lTnlUD9G6AoaVzvyP+dBYhl/4GpP5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761635221; c=relaxed/simple;
	bh=R5PmlZtWzHHZKGgXjshm44Mpf/Tt3lSzAseSYL5jpRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzucOB/8XnyIYVJpA02DhiE5mDCd104PopDpROPewnTxOpzS5tQ+DsPUeKVEzbWHQ/EylSYVS/pOgnwpF3ytcv0n/DZMk0U5p8c1328gAuepmD0YXp9W/DqHWnIoFqLhc7BQLJUY1t+Kys6UWxh7wc5c0pB0WrhgEBqBYCuQbpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzwFJfSV; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso8561167a12.0
        for <linux-omap@vger.kernel.org>; Tue, 28 Oct 2025 00:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761635217; x=1762240017; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R5PmlZtWzHHZKGgXjshm44Mpf/Tt3lSzAseSYL5jpRs=;
        b=kzwFJfSVlUIRSBkvPFV9cszKPEb5MmzumJf8w0+XB3pXNnxZv/a41B52lnt0FtfbyN
         F0jiWYoilHFD+EALeQxuTk9V1f8EpBHo0zbFKa4wuhUJ7sBjffc5ifCcXzuAq7K+eBlL
         CSjIQD+pKxpQimtjkX6h76APknIU7CohXlMemLCNc589+VSIAigrnVCtfRWopcSvSwBK
         skiPnUu5I+OvjuRuc4jNBjIWraXPw6UNpSnAXjpH+ze4mWrGFMP1F2wAWpGonz31Xhv8
         lGtwpyiBo63SfG5W2QAKj388T5jKkfbnqSXlIemloVX/us5My5X5u4+vFw7kwhYMNJMa
         BzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761635217; x=1762240017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5PmlZtWzHHZKGgXjshm44Mpf/Tt3lSzAseSYL5jpRs=;
        b=NaVOujAX3qG3FAXIv6kr6jxMcSxS5eusc0T6Hn367n0+K0O67yGUD3XhFo+3DpY8b/
         LEAy5pcy2GhJcVSxfQUxngUPYmEIb9XdIu4mUSJ6KXVDbY0YPCvcv2/0K99NSxIav5wl
         3oZmLJNF90O91EVEHciE/LiVDsYNkSLE86xRFmNh4uOuZ6oR0Gld4qvYuqRuDpChpji+
         UfYb+B71q6bFPAfyNqi0d0BcQd6AjDrJgGTYCS6fsH0J3GPzhqi7XQFgOf7fnfyDd5yV
         dcXSQr3EUx3DsCUEb4ZvcqyxNhXgcH26mdHDRl63ewapFlr2TzOaxKXiNgd330SxaMD+
         JPGg==
X-Gm-Message-State: AOJu0YwYZlOF2zGg40DilBWx/r2C9Ardh4e6jg81SPC4DEatjOFmKGr3
	RZ65rUSXY7Dmyo1RZ4F2ioNRHrDgdYmDcqknlrj8rHv67Tl2HsIUks8ZcnjXrevkP7wTPoWATVR
	3A0t1HQQa94NUz2qpG2CJutQhDzoHvTc=
X-Gm-Gg: ASbGncsgDV9AcMyxIraHWhb15dDS8NsYFJpIGSuZccNXF8ObMI8sTMQJfl/7L11gTUR
	zNqhLo59C9T7Pmbh2qTBJ2+2Mc0zOfH62OCTG/+vySnFi2awh/mUkCwfblgq5SzsSxOvG0o/bEd
	GAqLdj6zfa+XrtEqyAsGzeFmBxIXf6EuQasZMk/NWnd3oqh58qdiSGdsDOLqS3f1iFsuCyPfth7
	/QB9jKLMM+WDwqs/xl+izz87shqy53Fw7f1D6H+9dAb6fCcxgDZJczA9mU=
X-Google-Smtp-Source: AGHT+IFqdZ7449/+gCSESKkn4OY2k6KiWRXks4E+V02E2uPaH6yPU4wF8iJFvFXAm8oiIsJdQKeuKoRJ7jR1cSg+eCI=
X-Received: by 2002:a05:6402:5208:b0:63c:45da:2878 with SMTP id
 4fb4d7f45d1cf-63ed8262ceemr2111325a12.25.1761635216475; Tue, 28 Oct 2025
 00:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027090310.38999-1-linux.amoon@gmail.com> <20251027090310.38999-3-linux.amoon@gmail.com>
 <f36a77b1-79ce-4bd4-ba4a-b9260bae7f11@web.de>
In-Reply-To: <f36a77b1-79ce-4bd4-ba4a-b9260bae7f11@web.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 28 Oct 2025 12:36:39 +0530
X-Gm-Features: AWmQ_bnM6F6BzTGQqX_h0Uqm5Thyd0JbiSKKhO1nlm1lVvxcnt-IMVp2PL8CDLw
Message-ID: <CANAwSgT43rsi+DxaMF3T-gsVoAAGSSDEL6s+TE2yZ+q+W3bRsQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] PCI: j721e: Use inline reset GPIO assignment and
 drop local variable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

Thanks for your review comments.

On Mon, 27 Oct 2025 at 19:13, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > The result of devm_gpiod_get_optional() is now assigned directly
> > assigned to pcie->reset_gpio. This removes a superfluous local gpiod
> > variable, improving code readability and compactness. The functionality
> > remains unchanged, but the code is now more streamlined
>
> Would a corresponding imperative wording become helpful for an improved change description?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.18-rc3#n94
>
Assign the result of devm_gpiod_get_optional() directly to pcie->reset_gpio.
This removes a superfluous local variable, improving code clarity without
altering the driver's behavior.

Is this ok with you?
> Regards,
> Markus
Thanks
-Anand

