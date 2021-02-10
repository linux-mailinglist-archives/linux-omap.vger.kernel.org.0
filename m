Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8AB31601C
	for <lists+linux-omap@lfdr.de>; Wed, 10 Feb 2021 08:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbhBJHhP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Feb 2021 02:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbhBJHhG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Feb 2021 02:37:06 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B832C061786
        for <linux-omap@vger.kernel.org>; Tue,  9 Feb 2021 23:28:46 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id c11so689188pfp.10
        for <linux-omap@vger.kernel.org>; Tue, 09 Feb 2021 23:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5uqtGf5CCqy66/JjwaIuuUnPenLKUmHn5v6liPl8U3g=;
        b=Qkt4U5mpREt4/WZJTjiQFW+2vn5MKF7s1E6bJTJLuXsADw65wjgDysxGSxREoTMcas
         w0Kw4wTSDps0LopEj8djJQsWdEnuEWW2+eNgYXTtp0RTidhgDNEL3Z9UF2hV5+9gvpTu
         leWZBk/+HtcSdCl5o6/aDwjURnvpL+OJS9DqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5uqtGf5CCqy66/JjwaIuuUnPenLKUmHn5v6liPl8U3g=;
        b=gH9GcJXFpJVZX4IzjpwilxHXZaMUT24L+ogfXb+bfRtCQOyL7u5za5+w2nx6q2JKpq
         Of1WOc5TdlIiVfx0NKq7vp+KgX2IaNPlwG/9BWKG/YUJ01R1amDwXCxYcxOeFovFi7Od
         lyLlem42Y9a+H1lG2mc0fhCmhcsXpPDpatmKMCqXC8vh05XrBJsaCTLm4248VZEkMk8W
         OYtPaEvYSJhA84jj9wFvYV5i4fQvduk+OvA71zuXxNKNz8E1MAcmrgesI2W5w0QMrawW
         onDjkCZ7Xh7KjTT4XL6fOKMjjuADCQh2mW7mlFsNF9w1GtOnxxl8bMhbBmaIHjh0GlrU
         xzZA==
X-Gm-Message-State: AOAM532sZm14xxtTodQq7XleyMLTUloyQSxP2H2ItG6VkwzjX6hB4c9M
        BaEQRz1QFz/FwXdeh/jY9v2IIQ==
X-Google-Smtp-Source: ABdhPJwV5eOKpy0E4aeHsXAYkWpYTLdMRepjLDNbeaJUcG0z8uQOVAuVAyv61R807CcUJlcgBUctHg==
X-Received: by 2002:a62:1b93:0:b029:1cb:4985:623b with SMTP id b141-20020a621b930000b02901cb4985623bmr1754994pfb.59.1612942125460;
        Tue, 09 Feb 2021 23:28:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s10sm1166996pfd.101.2021.02.09.23.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 23:28:44 -0800 (PST)
Date:   Tue, 9 Feb 2021 23:28:43 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Joe Perches <joe@perches.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Bjorn Helgaas <helgaas@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        bhelgaas@google.com, robh+dt@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        kishon@ti.com, lorenzo.pieralisi@arm.com, hongxing.zhu@nxp.com,
        l.stach@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, m-karicheri2@ti.com, songxiaowei@hisilicon.com,
        wangbinghui@hisilicon.com, amurray@thegoodpenguin.co.uk,
        sathyanarayanan.kuppuswamy@linux.intel.com, hkallweit1@gmail.com,
        rafael.j.wysocki@intel.com, rdunlap@infradead.org,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] Documentation: Replace lkml.org links with lore
Message-ID: <202102092327.F6D8335A7@keescook>
References: <20200627103050.71712-1-grandmaster@al2klimov.de>
 <20200630180917.GA3455699@bjorn-Precision-5520>
 <20200630140417.3a2dba67@lwn.net>
 <77cdb7f32cfb087955bfc3600b86c40bed5d4104.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77cdb7f32cfb087955bfc3600b86c40bed5d4104.camel@perches.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Jan 10, 2021 at 12:41:44PM -0800, Joe Perches wrote:
> Replace the lkml.org links with lore to better use a single source
> that's more likely to stay available long-term.

What's the best way to teach checkpatch about this? I couldn't find the
right place to do it. (And more generally, can it also suggest https
over http?)

-- 
Kees Cook
