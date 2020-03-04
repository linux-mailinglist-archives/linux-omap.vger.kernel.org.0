Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C30B179BE4
	for <lists+linux-omap@lfdr.de>; Wed,  4 Mar 2020 23:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388425AbgCDWmY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Mar 2020 17:42:24 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:54671 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387931AbgCDWmY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Mar 2020 17:42:24 -0500
Received: by mail-pj1-f67.google.com with SMTP id np16so985029pjb.4
        for <linux-omap@vger.kernel.org>; Wed, 04 Mar 2020 14:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nl7CdImQYe8yN00GJXA4TWf+5G48+DqEC0606w3AO7Q=;
        b=MjQJRKj780yFaYsZPjrlEqTrcmIvPBSnI8wh1SeJYQZ1T64EAOr5oxCaDVf8KIZE/8
         IztcBNIV0hMJvMJCjkRITWZGnt6hWiOghPxQGLJTOkGzy5s89y7pjjueDAXBUfzaxOXX
         GK7eV3OvbNfG3AJtFXjJ9KxgYEhLcVu+ceTU8owMC1Y/We6NVXaDkJqZq+mCQVZhphz3
         655xdCxjsA8lk4qElprC6RFamlP2ny9ZZMPElE0soEMAm516eUlVdXvw9X8mOLeoii7Z
         FanK0IRItuw+4Sp7Gi7oK9giR5G4Sd2ALSQLhKUGYaSKXRaMfk0ZfbgT6NlN29fYHRsj
         TeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nl7CdImQYe8yN00GJXA4TWf+5G48+DqEC0606w3AO7Q=;
        b=XFgDk3dAiOFlY0gBn+GMEJqJNrq7vrb1xjmtqN/cqIdLneoQRdbTb/AbdNDwptNszt
         52QcwLN7w5CClv2141opmuS4n6lJ10fCeOrA/WDEpEzl0y5V9XCfLNakWL/RMXBLc9ji
         ghgUUnQytL+VMEx2EAWvD3MXUFvrwvf5yUjuQOb3pPiwDP3oCuZ5X2d+StIJ7oLgWE6Q
         i4fZhze63j7oSZvhJxmCFMaXp2OD+snT+uBZOIh0HIEj+OVaiZx3ergaqrSyYXD4UaZ4
         YUhDKi1QicLAK/SMA4DD08IJlETKwYFKg5ozYWLB4X2AI4U+C3vFYfoIK2n5Lef0hKeh
         KZKg==
X-Gm-Message-State: ANhLgQ0gYMPq9+k9FYo71Dyx6gRSHg5flQ6ykjDdIHCqnvBkiL4f08rr
        zbNU0W8fcnprWehzl4JKH0NU12hW/UQ=
X-Google-Smtp-Source: ADFU+vvOilnZdqUKfeagNbRk+58xQkNp6dKhGnKC+aBKi7yZqtxIi66oVGLv156OdkPDbUglDI39ZA==
X-Received: by 2002:a17:902:aa01:: with SMTP id be1mr4825036plb.293.1583361742714;
        Wed, 04 Mar 2020 14:42:22 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id z6sm4608572pfq.39.2020.03.04.14.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 14:42:22 -0800 (PST)
Date:   Wed, 4 Mar 2020 15:42:20 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, afd@ti.com, s-anna@ti.com,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv7 15/15] remoteproc/omap: Switch to SPDX license
 identifiers
Message-ID: <20200304224220.GC2799@xps15>
References: <20200221101936.16833-1-t-kristo@ti.com>
 <20200221101936.16833-16-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221101936.16833-16-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Feb 21, 2020 at 12:19:36PM +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> Use the appropriate SPDX license identifiers in various OMAP remoteproc
> source files and drop the previous boilerplate license text.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/remoteproc/omap_remoteproc.h | 27 +--------------------------
>  1 file changed, 1 insertion(+), 26 deletions(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
> index 13f17d9135c0..828e13256c02 100644
> --- a/drivers/remoteproc/omap_remoteproc.h
> +++ b/drivers/remoteproc/omap_remoteproc.h
> @@ -1,35 +1,10 @@
> +/* SPDX-License-Identifier: BSD-3-Clause */

This is odd considering omap_remoteproc.c is GPL-2.0-only

Thanks,
Mathieu

>  /*
>   * Remote processor messaging
>   *
>   * Copyright (C) 2011-2020 Texas Instruments, Inc.
>   * Copyright (C) 2011 Google, Inc.
>   * All rights reserved.
> - *
> - * Redistribution and use in source and binary forms, with or without
> - * modification, are permitted provided that the following conditions
> - * are met:
> - *
> - * * Redistributions of source code must retain the above copyright
> - *   notice, this list of conditions and the following disclaimer.
> - * * Redistributions in binary form must reproduce the above copyright
> - *   notice, this list of conditions and the following disclaimer in
> - *   the documentation and/or other materials provided with the
> - *   distribution.
> - * * Neither the name Texas Instruments nor the names of its
> - *   contributors may be used to endorse or promote products derived
> - *   from this software without specific prior written permission.
> - *
> - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> - * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> - * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> - * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> - * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> - * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> - * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> - * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> - * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> - * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> - * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>   */
>  
>  #ifndef _OMAP_RPMSG_H
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
