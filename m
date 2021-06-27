Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96663B529C
	for <lists+linux-omap@lfdr.de>; Sun, 27 Jun 2021 10:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhF0Iux (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 27 Jun 2021 04:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhF0Iuw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 27 Jun 2021 04:50:52 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D719BC061574;
        Sun, 27 Jun 2021 01:48:26 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f30so25712280lfj.1;
        Sun, 27 Jun 2021 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Dr7IlCFxFMjzD5ZoiWZkQrtRVuiEBN/27kUtcpWfMU=;
        b=TI3aLnYRD0arKqMnRsDNfa/vCBd+Y0g1C5LivRwwsMLRUzUasYfwVo84CC2nFbxR24
         fhHPFLaop/O7TnCXlmdBKuZ2dVxcliIfIeXm60w+g8tbxvByi8kGWz//SguzkuXGKi3e
         hXsczrECSS/p45p3JFODhJYp1SVfWHVNClHNU3kDyy5v8MRF3W4qmwmsdXfCtRwl/USm
         u7anhww0TYZ6mWGFScQibL/ofbOsLVkmpWUqHkcwoYyGNHvfjBPdosFyx2XezOXGzTZk
         442gVwS0SglQ7JkDiucb0FPREfd58fRHflgDLQHfa7pK03paeVeJZWGxDG4uzXHffGMF
         RsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Dr7IlCFxFMjzD5ZoiWZkQrtRVuiEBN/27kUtcpWfMU=;
        b=nhRjVnI6z3zSVJsWEXJERfqgjv9fKS7M87d+L3Tb67rtH2rfE1EUam6fj9Gl4NhOBx
         R9nOr2i5Tsi5WjWez8SOgkPBOHej2vLUEfkq/e/YlvfIcBYEJmgi2rdJWwPxiseIN6Yz
         dbfH6T1qiypbBKILKjttAwglszya8zVREsMS4rPKx8576gM8dMrOl+azRUqis4BpQ3hI
         yFH4mJeZWDZPDPXBlwh5MGdUBHsvtwRWPMBbMU3j/tMcCIGm/2WtqBz/eoweXwoQcGas
         LNk39EnAC1Jf01r1qM4CuXDfHORc0W5hj5R8c6m9cH3WChM6TTosd+i1r4w++k7ZZDyD
         JoSA==
X-Gm-Message-State: AOAM5318ISyl5JhONODnjndFwh0v19fk0AsWuXVwa1amxOSxz8mA19ON
        VRhxpnpKu93/vLKfysWn4tY=
X-Google-Smtp-Source: ABdhPJzR+MkVprcpoGGzZSSVXUV+lH5UnwMEPYmOcsb2fn4Bud+wu9dT2w8b64laAvqaUxWHv5HElw==
X-Received: by 2002:a05:6512:32a6:: with SMTP id q6mr15279057lfe.308.1624783705197;
        Sun, 27 Jun 2021 01:48:25 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.89])
        by smtp.gmail.com with ESMTPSA id b7sm982604lfb.121.2021.06.27.01.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 01:48:24 -0700 (PDT)
Date:   Sun, 27 Jun 2021 11:48:16 +0300
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     gustavoars@kernel.org, sam@ravnborg.org, tomi.valkeinen@ti.com,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] OMAP: DSS2: OMAPFB: fix potential GPF
Message-ID: <20210627114816.5e9d042b@gmail.com>
In-Reply-To: <20210626231423.GA38365@macbook.musicnaut.iki.fi>
References: <20210625223323.13930-1-paskripkin@gmail.com>
        <20210626231423.GA38365@macbook.musicnaut.iki.fi>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 27 Jun 2021 02:14:23 +0300
Aaro Koskinen <aaro.koskinen@iki.fi> wrote:

> Hi,
> 
> On Sat, Jun 26, 2021 at 01:33:23AM +0300, Pavel Skripkin wrote:
> > In case of allocation failures, all code paths was jumping
> > to this code:
> > 
> > err:
> > 	kfree(fbi);
> > 	kfree(var);
> > 	kfree(fbops);
> > 
> > 	return r;
> > 
> > Since all 3 pointers placed on stack and don't initialized, they
> > will be filled with some random values, which leads to
> > deferencing random pointers in kfree(). Fix it by rewriting
> > error handling path.
> 
> They are initialized before the first goto:
> 
> [...]
> 	fbi = NULL;
> 	var = NULL;
> 	fbops = NULL;
> 
> 	fbi = kzalloc(sizeof(*fbi), GFP_KERNEL);
> 	if (fbi == NULL) {
> 		r = -ENOMEM;
> 		goto err;
> 	}
> [...]
> 

Hi! 

Im sorry for this, I should not stay to late night reviewing the code
next time :(




With regards,
Pavel Skripkin
