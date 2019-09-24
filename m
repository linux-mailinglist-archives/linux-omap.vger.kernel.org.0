Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5E02BD244
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2019 21:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391680AbfIXTA4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Sep 2019 15:00:56 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:38670 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbfIXTA4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Sep 2019 15:00:56 -0400
Received: by mail-io1-f68.google.com with SMTP id u8so7117125iom.5;
        Tue, 24 Sep 2019 12:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/poXcNaPImsCkHOsb+IHz5eVbMSJsczlFsct2m7oOgc=;
        b=sHJ1UGr+A5LvATOEjqybLlMDMbqFel8di7dayKOPx29Eq4zK27NF6UK61rwXBgsVS8
         ExvK/uGFmCIem6mJf6kDaCQHrK9znWnzSrGVx7ZFlR8FaTy5PNI7OkBRqMErhI7G6ylc
         lRzUNSWihhvzFiExeDyjpZpO0NiW9VSiLSvJoDTyeuTlrifxOkTqM8jr1JQ188OE8+cT
         DrzKZy08l9YqSJke2WvzO4iUxr+6ObioHkazKnkgqjMV08uGMSsOAfAc+sOROOHnK8Ze
         13vCc6G82L4dBo9XVWvaV1WMJrL0FLVmor3AFyXIB9OkMqcwcebvN6Wx1Y/he54s8kQC
         DC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/poXcNaPImsCkHOsb+IHz5eVbMSJsczlFsct2m7oOgc=;
        b=nb4XFH41V025S11tGnuMmfPLHltLG67ZL0Th6oXR2JWrvCyzIah+ozud5CVK+jWfFX
         yzpFgMqsuOa50WBeutI07ZFFDgTP6q5zCEFuJu9dW2+DBb8rAUbR2Pt5hg0J4ae+dYY1
         moykb9gKw9bv2kSjFQKl2ZrOKmmRZKpCUjqO9B/49GQLJZ5LXRADakoDl4K3/06NYC0G
         YwoWwMiYfCIWHVvhyYrYLOSKaCUvsbbhCpXysl2iILaJMxHSjjXsRav4VeGIR1otYg/M
         7trS9AqWN0UxZbEspsBHjGm4bctWorSSaMsNRLdF/TeG3ky5BM4suww4o2xHuRK1tTqf
         KMgw==
X-Gm-Message-State: APjAAAV6oL8vCn2XN1UPTpOBYcsqBocVZlUQCRzv79bf5FtN1acKwxvT
        oR9V+x28lFiahLNY6SiBUsK1hp5PKSw4LYubFyg=
X-Google-Smtp-Source: APXvYqy/VoYXHn8FHc4GUb/SVvX9H/ShxuZ2vA5n7J/xs1YmNhW/qWGzu14sSS7Rn1ed3AM95fvhp3hDB5tF927bIYs=
X-Received: by 2002:a05:6638:3a5:: with SMTP id z5mr307586jap.95.1569351654867;
 Tue, 24 Sep 2019 12:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190923134449.22326-1-aford173@gmail.com> <20190923134449.22326-2-aford173@gmail.com>
 <CAL_JsqJB54aTWNxh+FsEOBRFEWXBi6WZE3pzqo+LJWM781v-PQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJB54aTWNxh+FsEOBRFEWXBi6WZE3pzqo+LJWM781v-PQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 24 Sep 2019 14:00:43 -0500
Message-ID: <CAHCN7xJy4=gdSz5Thhy_be-NNFhf4FaJ=iv8=F3sXbPwaQu1xA@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] dt-bindings: Add Logic PD Type 28 display panel
To:     Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 24, 2019 at 1:56 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, Sep 23, 2019 at 8:45 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > This patch adds documentation of device tree bindings for the WVGA panel
> > Logic PD Type 28 display.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> > V2:  Use YAML instead of TXT for binding
>
> Fails to build with 'make dt_binding_check':
>
> https://patchwork.ozlabs.org/patch/1166057/
>
> Looks like a tab character used perhaps.

I am not familiar with yaml.  I thought I copied an existing file but
apparently it didn't work.  Is there a recommended editor that know
this markup language?  Better yet, is there a script I can run to
convert a text file to the yaml?

adam
>
> Rob
