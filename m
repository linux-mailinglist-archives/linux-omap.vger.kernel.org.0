Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADC620B1DE
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 14:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgFZM7A (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 08:59:00 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:52859 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgFZM67 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 Jun 2020 08:58:59 -0400
Received: from mail-qv1-f46.google.com ([209.85.219.46]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mysa4-1itwC80RtK-00vvPQ; Fri, 26 Jun 2020 14:58:58 +0200
Received: by mail-qv1-f46.google.com with SMTP id u8so4399259qvj.12;
        Fri, 26 Jun 2020 05:58:57 -0700 (PDT)
X-Gm-Message-State: AOAM532l3qXYd7iAH8RyzSbqqs2qpjkPVmHNBk7Ad461Gca5zXH3aDdU
        AY1+j/NNfRFSaEsmDbptRCYxEh+WlZL+h5zpXYg=
X-Google-Smtp-Source: ABdhPJxAtrHTrv8tnPhop9bBePLdn9dbmNZaCWb8bd+izbtJeOoFbJPjUmEqBnnSjX/letu0DIzFRKMsNUQjrX8onBo=
X-Received: by 2002:a0c:ba0e:: with SMTP id w14mr3005212qvf.222.1593176336945;
 Fri, 26 Jun 2020 05:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl> <20200626115321.1898798-5-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20200626115321.1898798-5-hverkuil-cisco@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 26 Jun 2020 14:58:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0XNb5=4F3QMpO+CtQZuxvKdmKrHPjZ80fv0Rgt4U0pfA@mail.gmail.com>
Message-ID: <CAK8P3a0XNb5=4F3QMpO+CtQZuxvKdmKrHPjZ80fv0Rgt4U0pfA@mail.gmail.com>
Subject: Re: [PATCH 4/7] mach-omap1: board-ams-delta.c: remove soc_camera dependencies
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Ork1ET+c04+hSBKQ1yMj702x1fG+5wEXK5bt0hMjflygrR2HN+7
 ig/x7EffakjJm/2N2nPMd/Mw4wH0PqM9UxgY5FC9V+OalHZmknsjlJRr48sc8yDuygZshSv
 uU5BPGE7UnEDmFGOlS80L206DtpWK+SY4xQyDfrqPMb9nNJJ59bNQcIiDQ6BAgXRZVlJDJF
 nmEV66A7LPP7AEAdramgQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JhYzfDP/V+w=:TsK8cabEuR8ZeppIRb6VBr
 EXaTagebTMTqD69uO0NV8S900z3V7sH827EvD67fQzAivnFAWa4YIyrJ4Th9kY4HsvXL8xPKR
 weSpgfU98ebCpX8w/dgoew3U9lf3pv7rFjb8PsdZUbOC6ywddgvJFhZjU8JqzAkIk1VmKDx4f
 V80o3ByrNyxfgyU9Tkbc8DMHxn2wO8nmfW75xy/poUbgYnYF49ebE4gCj5Kbsft6ZW1g6QB3x
 g+qPVpPn7s4NTwPOnN4C9cI7TL5hQxZaUUCPjTtmlN0IgW0Z9SdXWLckivPq1RTmeAo4LU5lT
 baxUdYAuWxkHMrsqyOWUALGI2XgD2dLBT6Gcou3eWENtZ/KHdWJVLepoBmZDh+4TOlihymiH7
 ds05+NnsJWSWvPmfCe4A1nRbu3hCi0/VvZsNTn0Wil+YDvflVebpve0ECU0pu7CRmbODFA5L4
 a9RRKPEKPbpVCZgVVtWatk75cmfSs2cO6jwolHEQXMfCt3fwlZ07qjk1ZmfPDddtS+JOjBwPO
 OGBiapp8sKDZdDYipH3Hb1hnLeKn99Zc158+bAVc4daci/hLWvB4VpGCZ922w6a0p7RCSHlgZ
 XNkARAkm2JG8GMGcY8Cz1cCYqMsQ5qnwmyLpkH3qnjPcTxiWrpgftK7W5qWnrxFnuuvoAJXzC
 pCGXPR0BcvmQqCkt93aU6sPesnk5wVeE6hYiZwLBbmck40Y8S4OFFgba7rHaS2zZ/5U/iqr6/
 u8icXuAs5FBBrS9SOpMiHQY2J7T+hfzJll3l0USpRpmPQ73OPvZL6O4i8ZqTzVO4onNc436vW
 EgZ7WKC9VsdXbWY080mtkOxCgoDhTmQqbULZQumOfXO+PGuRYk=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 26, 2020 at 1:53 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> The soc_camera driver is about to be removed, so drop camera
> support from this board. Note that the soc_camera driver itself has
> long since been deprecated and can't be compiled anymore (it depends
> on BROKEN), so camera support on this board has been broken for a long
> time (at least since 4.6 when the omap1_camera.c was removed from soc_camera).
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/mach-omap1/board-ams-delta.c         | 32 --------------
>  arch/arm/mach-omap1/camera.h                  | 14 ------
>  arch/arm/mach-omap1/devices.c                 | 43 -------------------
>  .../linux/platform_data/media/omap1_camera.h  | 32 --------------

Acked-by: Arnd Bergmann <arnd@arndb.de>

Please merge this through the media tree if there are no objections.

      Arnd
