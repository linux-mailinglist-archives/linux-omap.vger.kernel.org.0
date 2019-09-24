Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A778BD22C
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2019 20:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405436AbfIXS41 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Sep 2019 14:56:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:50398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404492AbfIXS41 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 24 Sep 2019 14:56:27 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F24B217D7;
        Tue, 24 Sep 2019 18:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569351386;
        bh=LSnxNkAK4K1j/IzwlV7DqnevZGMvr4ZQeIMxCU8J5vQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tFN0/Q3HSpKyaXRS1ezEo/lWr3qRUDs/uDBOZ0JD5QKSQwx6572O13z/K2D64zcEk
         DLSyWNnDZgsD95DB5ZqPoXEfDReQiNObo9wmkZ0QGcvJHHs/KNSDVlQgkX4YCqLqsy
         Y1oAm6zkblqjwIwRCXs3k4IWGlVBmr37CG6SMiQQ=
Received: by mail-qk1-f170.google.com with SMTP id 201so2862883qkd.13;
        Tue, 24 Sep 2019 11:56:26 -0700 (PDT)
X-Gm-Message-State: APjAAAX4rcaPUy+5rISB8e5kuTXglt9bAdVXBOO0vQ60VDqthSDGgG3a
        QaVCzjBip00Z4Ry70Iw20NRrcfbzPJAH1n0K6g==
X-Google-Smtp-Source: APXvYqzgGJQAxwg29kI1BAufWxuS/v+zfPqBzGSeDOF57xsu58JMb98Gap3AA0MrWWA5pI6TPglIXyu9nnpsuaZGoBk=
X-Received: by 2002:a05:620a:549:: with SMTP id o9mr4215400qko.223.1569351385602;
 Tue, 24 Sep 2019 11:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190923134449.22326-1-aford173@gmail.com> <20190923134449.22326-2-aford173@gmail.com>
In-Reply-To: <20190923134449.22326-2-aford173@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 24 Sep 2019 13:56:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJB54aTWNxh+FsEOBRFEWXBi6WZE3pzqo+LJWM781v-PQ@mail.gmail.com>
Message-ID: <CAL_JsqJB54aTWNxh+FsEOBRFEWXBi6WZE3pzqo+LJWM781v-PQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] dt-bindings: Add Logic PD Type 28 display panel
To:     Adam Ford <aford173@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-omap <linux-omap@vger.kernel.org>, adam.ford@logicpd.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 23, 2019 at 8:45 AM Adam Ford <aford173@gmail.com> wrote:
>
> This patch adds documentation of device tree bindings for the WVGA panel
> Logic PD Type 28 display.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  Use YAML instead of TXT for binding

Fails to build with 'make dt_binding_check':

https://patchwork.ozlabs.org/patch/1166057/

Looks like a tab character used perhaps.

Rob
