Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 879F213DEFB
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 16:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgAPPiI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 10:38:08 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:40509 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbgAPPiH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jan 2020 10:38:07 -0500
Received: by mail-vs1-f66.google.com with SMTP id g23so12936254vsr.7
        for <linux-omap@vger.kernel.org>; Thu, 16 Jan 2020 07:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jCvTIS4tQ0YDMzCJhY2iGF9SQox/7L34IA0xGsxARiE=;
        b=FXRNGX/w/8s6ukiHZP+xAG9Zk17IzHamP/KeDDJ5CfUSWDGk2795kT8yFUVPZMk7lh
         h6QrLucI0RcrkGe43+uE0PqL5kSYpl64RcGrRdOs8yo8UkWbvPFSELFaQgs0RrMaR7Qo
         0Q88CpZJuQVF1b0k/oD5FuoDd3CUSfD3aLPcZ1XWlyGa3tS4n2E0GR6X3zZzxmReAIJv
         mtTIwyjXDAJUpMIGJFjbandsyp6h98X3Z4AFspkLd0By4AUghD84n1BTek4uVT7ARcu4
         8ISc43o/dSN8TA0Vqal/6FyfhS188tePVRJXMI8M5wObPdEBXAuy09rU5KbArtkM0Zsw
         emAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jCvTIS4tQ0YDMzCJhY2iGF9SQox/7L34IA0xGsxARiE=;
        b=nUTQXZXFc1EKYmBp0NsxE+ZNwc9G2S3napsIEKjvgaTLA3Tsb7/4lIEv58naQJl5Vo
         5qpK2fWyaWs0hP44/ZnW5s23c6+sbl/Bvsswr4KbecWJb2Wj9M+MIm/qe4DdLCzd9QhE
         FJm24dqMOry9fBPGYispSNSIxz+eTkduLWMcesLzwFvjUiuPy1UmfPsAiSJPE3p8xGs0
         25RBj5rAnD4n+vXELgp3kI47iSMvWLo+NdnMFbl87Nige2ALdjU63hUJ1UjfjzD8lQwV
         6kfxLkhaJvmoN8WpUg1Aixq4/IuF6einIDOz4KdyL5ljpDTRfCTuqZsSpT2rnQLjB56h
         +9PA==
X-Gm-Message-State: APjAAAV76X5FqiAtYQmk6WCtCrG3yp/pMVZBsgIaB8cNJYdjY2O9X5IN
        rkiWfY/9LO4S11IoELUcDappC1Hk6nm/0LAj0vna7A==
X-Google-Smtp-Source: APXvYqy2V8F3EIjtcs1c9fMRvkA1J11vpDWvxXSJ1z8tJfNzatLNryfS4NCA8fn+jw7VSK908AVNNVcnzvPLNa3iRwU=
X-Received: by 2002:a67:e9da:: with SMTP id q26mr1949156vso.34.1579189086215;
 Thu, 16 Jan 2020 07:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20200116105154.7685-1-faiz_abbas@ti.com>
In-Reply-To: <20200116105154.7685-1-faiz_abbas@ti.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 16 Jan 2020 16:37:30 +0100
Message-ID: <CAPDyKFpaFgqRXbO-ezqVDqBM6MCbR884iz4oDCHvPvA5ML_D=A@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] Port am335x and am437x devices to sdhci-omap
To:     Faiz Abbas <faiz_abbas@ti.com>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kishon <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 16 Jan 2020 at 11:50, Faiz Abbas <faiz_abbas@ti.com> wrote:
>
> The following add driver patches for porting TI's am335x and am437x devices to
> the sdhci-omap driver.
>
> Patches 1-4 Add Support for external DMA to the sdhci driver.
>
> Patches 5-7 refactor the sdhci_set_timeout() function and use it disable
> data timeout interrupt for erase commands
>
> Patches 8-9 add new compatibles for am335x and am43xx devices to the
> sdhci-omap driver.
>
> Patch 10 implements special reset required for am335x and am437x
> devices.
>
> DT changes will be posted as a separate series.
>
> Tested on: am335x-evm, am335x-boneblack, am335x-bonegreen-wireless,
> am335x-sk, am335x-bone, am437x-idk, am43xx-gp-evm, am43xx-epos-evm.
>
> v5:
> 1. Patch 3 now uses the dma_submit_error() API instead of checking the
>    cookie on its own.
> 2. Dropped the patch adding ti,needs-special-reset property to
>    sdhci-omap. Using a flag in the driver instead.
> 3. Minor spacing changes.

Applied for next, thanks!

[...]

Kind regards
Uffe
