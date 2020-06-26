Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94F3220B1DC
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 14:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgFZM6i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 08:58:38 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:37167 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgFZM6g (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 Jun 2020 08:58:36 -0400
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MjgfT-1j97aL3gwF-00lILB; Fri, 26 Jun 2020 14:58:35 +0200
Received: by mail-qk1-f175.google.com with SMTP id k18so8614321qke.4;
        Fri, 26 Jun 2020 05:58:34 -0700 (PDT)
X-Gm-Message-State: AOAM5338Am5yO9SmxtmMqppn1UZl4jzCZLf4UvUbUswftK4LXYmbbITh
        hv3KIP3beFGbL4UFYXCUYnMzqZdOzq/TuQXiHDM=
X-Google-Smtp-Source: ABdhPJzDfJJF887IBIHwrqjS5+XNkf6aPwW0DG18i+u68IAHRbRtFhbDNjl1YtlahPyTzjUQNGbtNbLSVDouT+LYRVE=
X-Received: by 2002:a37:a282:: with SMTP id l124mr2413294qke.3.1593176313613;
 Fri, 26 Jun 2020 05:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl> <20200626115321.1898798-4-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20200626115321.1898798-4-hverkuil-cisco@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 26 Jun 2020 14:58:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1UGwUR4nc7NRrFQ-heUZ4LOxSRDmVJGf1kNDz9nWqzfg@mail.gmail.com>
Message-ID: <CAK8P3a1UGwUR4nc7NRrFQ-heUZ4LOxSRDmVJGf1kNDz9nWqzfg@mail.gmail.com>
Subject: Re: [PATCH 3/7] mach-imx: mach-imx27_visstrim_m10.c: remove
 soc_camera dependencies
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:oOGesCcERp2mwQ5fcYfZHaZ/uAkOSCMspN0SqFGumGqVZBUqvRJ
 kK6Am1LWVx/jK59AJOsl9cGIIu5N5mrPY5BMSg79qZICFsIppwEm/qYl/jOEGGCm+cjHsnd
 y/yHckdWrBUW2gSAEi2zNAg4gzSDZ15Ch+vm77l1Dj2Dn1zg3aZDRPOEsKJaQGZNo3JFGtl
 dwtBOkgMHHCsKXfphjQxA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:arhdJ7doB7k=:81dTRpOYePIhBz/VHAofSf
 mux+Yi+XYLq6cGBfkFf5DvkCKjf+Rls5aVf6K+hcwDcM/gZYDk3z8nBJqE7cYce1olcgDVb3e
 rN1aT94amWPbMFVoNSLcbjhENVAg/hkNaskrGU9Zi1NKO9gQI7AqH5HV+jn7K98DyZolLVjYu
 OPzeoPcqXyy+1AhMdQLgyMq8gIs5AOA9KbWUhoQeC/ZX8iOLlhmQqEUJAhXzRacvxvrE8Txcb
 N6coVSrSnC7LhMOOWE4+zue2Fm27f/Aonlhz2XzhbOjaeHH7k3qnOs8blcILKr6CT93XZchI8
 67JqgX7R76H68UQUctevgRDMEThvqfkgmVI7PvMC13nCJDKm4tAETqrKiGG67jaQ/ZW3+d0eI
 dyHIAPoZYngth2pG+Y3d3/cIr8Qn2Wp/jFyKlrMrxkegcIGc1pcCrPhoOTsVTQTgviZzyhDfk
 Nw1eNcA1oqvI8qT/38oEbJRefqiF14yeMNauq70nn2PCzYvqtZLx1pFq9IuIDJ5vIC8hV65O4
 R3LAqtHRLZ93yytb3BIFNef/o5OOVV1cvPxABYL0T0drgrY8SsOaG62vgklSzuHpsRxiJi8pJ
 7PTE1qD9NpjXXzojA3MrwlDx9iQQ73j+asU6ccREnbI+G2qAxOrgSfXoDsatCIRKUesQcW3dw
 XxsJSkv6PjpoOeOphawucvgUnPgLhPsJGuScSMIwWwzbdTxxXRt9lwjtgDmTDnBrEA+iC5GiY
 a9K7zaXphi4siC5FyLVWwj0ivUWhyTWE5prhSYx7HDwyBIwGDaY6HUDZLEclI9KnvDR/VvLOE
 DnGBKWlUgJ3oNhLnstRAwGJASnT7724cb9p2NfpAlltq4dpeG8=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 26, 2020 at 1:53 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> The soc_camera.h header driver is about to be removed, so drop camera
> support from this board. Note that the soc_camera driver itself has
> long since been deprecated and can't be compiled anymore (it depends
> on BROKEN), so camera support on this board has been broken for a long
> time (at least since 4.6 when the mx2_camera.c was removed from soc_camera).
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Arnd Bergmann <arnd@arndb.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>

Please merge this through the media tree if there are no objections.

      Arnd
