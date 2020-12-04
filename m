Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D432CF2E3
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 18:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730972AbgLDRNw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 12:13:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33845 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731083AbgLDRNv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 12:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607101944;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yWYHyCKIbQ5CqOTj7P8m/dCESQn9iEeIL5I/52HtXjE=;
        b=D32zd4l1suU6szrcOyFp3Cv+jqvX90aasnhOoFKI9xB9UYK2HnL2SY57kbnnlp/cbVcEta
        QLHSzelkEMU/n+HjYIRxLeDHqTB74LqUqqbiTcnlttoAajlV/o0PgDj+LB665HOVIzEkhD
        jGa8aBBQIc6uq3xsUg2pYOiHKS0Klyk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-X6oDTk_sPe6uAQuYXiAN8w-1; Fri, 04 Dec 2020 12:12:22 -0500
X-MC-Unique: X6oDTk_sPe6uAQuYXiAN8w-1
Received: by mail-ej1-f70.google.com with SMTP id u15so2308131ejg.17
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 09:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=yWYHyCKIbQ5CqOTj7P8m/dCESQn9iEeIL5I/52HtXjE=;
        b=ji7T1Revblv0Q+tpwprrWhf2OZlp9h3Bh7pUZ96P139Dpa+fbk4ZIYrHaMscUVGUgE
         7lBUwauX6yk+3JvU2su44yXYE1uWvOI/1ug1xYn2Pdx4axmAtMHHzIL9SAsO6/pRJpSQ
         ynstz3CUcCtdvm9bvdFOB5S7r1xdpIYEF3kVpo1djWA+AwGNqOwe5Zr3EchqlotlDaOe
         PPHNOC4LWcZZzhlZrmoLCz+5L79zUOzI6ol2Xz6wL2GIa8vrH57GjCUKwVdwPVTh5cpK
         g2JZqppEULBp+Ne/JRUvppuIdgesPG2TXc+VlE8Ji2nqe/K6l2MqO1xarVI8iK3rzr1x
         Qbzw==
X-Gm-Message-State: AOAM532y0N+rjn+VKN6y5odqCNe0NNiehmJtJC1kyuq3S1JsnLDHoXTT
        pGo/1cDmFoCzM5lcIbgaBxhcbh+oKx03V82FeMFbQ5YLTdb6xD3jFKTPykWAxm93Qv07vM0ytkG
        QRu4VSncl2fNP6db2x0uajA==
X-Received: by 2002:a17:906:c45a:: with SMTP id ck26mr8034645ejb.200.1607101940857;
        Fri, 04 Dec 2020 09:12:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFwm7R66i5Di6W14LTLp3SYQct39lRrmjBD2WngBk8bbybokaL2QxsnzSxWJcIqkdTuqannw==
X-Received: by 2002:a17:906:c45a:: with SMTP id ck26mr8034610ejb.200.1607101940594;
        Fri, 04 Dec 2020 09:12:20 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id g3sm3653185edd.42.2020.12.04.09.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 09:12:19 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 85FBA182EEA; Fri,  4 Dec 2020 18:12:18 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andriin@fb.com>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@chromium.org>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Romain Perier <romain.perier@gmail.com>,
        Allen Pais <apais@linux.microsoft.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Simon Horman <simon.horman@netronome.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Jiri Benc <jbenc@redhat.com>, oss-drivers@netronome.com,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org
Subject: Re: [PATCH bpf 1/7] xdp: remove the xdp_attachment_flags_ok() callback
In-Reply-To: <20201204084847.04d9dc46@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
References: <160703131710.162669.9632344967082582016.stgit@toke.dk>
 <160703131819.162669.2776807312730670823.stgit@toke.dk>
 <20201203174217.7717ea84@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
 <87o8j99aip.fsf@toke.dk>
 <20201204084847.04d9dc46@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Fri, 04 Dec 2020 18:12:18 +0100
Message-ID: <87sg8l7ax9.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> On Fri, 04 Dec 2020 10:38:06 +0100 Toke H=C3=B8iland-J=C3=B8rgensen wrote:
>> Jakub Kicinski <kuba@kernel.org> writes:
>> > On Thu, 03 Dec 2020 22:35:18 +0100 Toke H=C3=B8iland-J=C3=B8rgensen wr=
ote:=20=20
>> >> Since we offloaded and non-offloaded programs can co-exist there does=
n't
>> >> really seem to be any reason for the check anyway, and it's only used=
 in
>> >> three drivers so let's just get rid of the callback entirely.=20=20
>> >
>> > I don't remember exactly now, but I think the concern was that using=20
>> > the unspecified mode is pretty ambiguous when interface has multiple
>> > programs attached.=20=20
>>=20
>> Right. I did scratch my head a bit for why the check was there in the
>> first place, but that makes sense, actually :)
>>=20
>> So how about we disallow unload without specifying a mode, but only if
>> more than one program is loaded?
>
> Are you including replacing as a form of unload? :)

Yeah, that's what I ended up with (in v2): Any time there are multiple
programs loaded, callers have to specify a mode flag to avoid ambiguity.

> IMHO the simpler the definition of the API / constraint the better.
> "You must specify the same flags" is pretty simple, as is copying the
> old behavior rather than trying to come up with new rules.
>
> But up to you, I don't mind either way, really..

Well that old behaviour was what led me to investigate this in the first
place: If you just look at a program that's loaded, see it's in driver
mode, and then try to unload it with flags set to XDP_MODE_DRV, it will
sometimes work and sometimes not depending on what flags that program
happened to have been loaded with. In libxdp this is exactly what we do
(look at the loaded program and set the corresponding mode flag), so I
ended up getting some really odd bug reports...

So I really don't want to keep the current behaviour; if what I propose
in v2 is OK with you I think we should just go with that :)

-Toke

