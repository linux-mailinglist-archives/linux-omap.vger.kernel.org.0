Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2445A20FCC4
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 21:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgF3T3p (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Jun 2020 15:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgF3T3o (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Jun 2020 15:29:44 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F17FC061755;
        Tue, 30 Jun 2020 12:29:44 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k5so342966pjg.3;
        Tue, 30 Jun 2020 12:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z9NbGrJNVhmDvwjE4p/JaViBJ44BVQVTuZHg6UXMIYY=;
        b=co3GS2Cjq3IS4PBvsxpk3iaeANWXu9yXQTCa2iad2uBkShSkMJdxn3+XTqZQwNfDXy
         RlY76zsgVjCL43sSBus5UM6FBRu0aVIGHO4JN/bDnKmaer8C5enTUMgjW4YUfz0eEODp
         txdPInWQ7GWQUOgDHHs67W+oOI5hBCYfzX84Pyz9UvnCOi9y2q9BZsXzQtKmfkRJwZS/
         DSpFrB5U9oQ8oRblkl/qrgws8AvvQ8uhGK98S0lQDOU8OMLjrYC4/eH9XoZZOebAzwN3
         GMrQM3PT/yZRtiT7PUVWYyuFrPxxrQknyJOyE0djQIFkCeBzVBbtogf+f5Rg3LzrjwjY
         5UiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z9NbGrJNVhmDvwjE4p/JaViBJ44BVQVTuZHg6UXMIYY=;
        b=IJ1p4wsJ8933pTc/90QJlWLZOVSf+VxrPV0IsOJCBOVWIgIw0WzFeUgAipJCoZfo3s
         IetVpmsBSlp0AmQJfvYJVRt8RzYYPgPGn6EgTm3pkd1t7ATGMNpRuC6Ek7b34OxIl3Ly
         0XSy2p+RBFriT9v0pJCZyKuELLs9S1yeAoW97hvxpMRyc+zxJQq5cADi7Li8nNxd7FDK
         ms7Tbqo7yqhbtnv9aiPDHnetMKMMKBMQrZx2IgF492WB+eNCbAbUuz7HaSLNG+27A8oa
         SMusYD7DnsJUec00RYHnsNoCNT2ROzm81mZL6OvSSNgRRkFIyFlVAxe5uwmKhAPsm0Kk
         bZoA==
X-Gm-Message-State: AOAM533VYVJW+nsZ17bV/+OIiebLSAYxaGNpjw9V/EvDo7Yr2sD8fB/8
        bmjv9GUbuTixMfrBQ309ypk=
X-Google-Smtp-Source: ABdhPJwv4jFJgO1XEbhIRLji/2KijRhr9g67KUtACfRcPhhVmiFQ8SFh/i4yjIkB/MOaOvhH2n3yTg==
X-Received: by 2002:a17:902:8a8f:: with SMTP id p15mr19083179plo.172.1593545383723;
        Tue, 30 Jun 2020 12:29:43 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s12sm3554059pgp.54.2020.06.30.12.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 12:29:43 -0700 (PDT)
Date:   Tue, 30 Jun 2020 12:29:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     pavel@ucw.cz,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mattias Jacobsson <2pi@mok.nu>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>,
        "open list:OMAP DEVICE TREE SUPPORT" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>
Subject: Re: [PATCH 0/2] Add SW_MACHINE_COVER key
Message-ID: <20200630192941.GI248110@dtor-ws>
References: <20200612125402.18393-1-merlijn@wizzup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612125402.18393-1-merlijn@wizzup.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 12, 2020 at 02:53:57PM +0200, Merlijn Wajer wrote:

Applied, thank you.

-- 
Dmitry
