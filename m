Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3696E155B44
	for <lists+linux-omap@lfdr.de>; Fri,  7 Feb 2020 16:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgBGP5D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 Feb 2020 10:57:03 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:39214 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgBGP5C (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 7 Feb 2020 10:57:02 -0500
Received: by mail-io1-f68.google.com with SMTP id c16so30661ioh.6
        for <linux-omap@vger.kernel.org>; Fri, 07 Feb 2020 07:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=u2350BC6Tj+VGKH42GVsogueTiuUeAkWfuCJy5MqcTU=;
        b=A98CG2S5b9Sf33XGqS6Gg1vAx+H9ceExh9c5IyIgx5+KN5tZmxFpazaacmZ9N41FPr
         6bBvn74GYx8blR8kOCyG4ez3Exu04NbZ/Ung1fTr/wkh7yE5cEKQg86BSl29/ssFTfkN
         CR7rUJcyQ1y5bpDNYxmceUw8Udhld2mqXJrbXTpw3hTYs5sty7UCjobQYfwRShmVeqUb
         AHeos7404mk7s3FIFmmBiQDqPCOAXhY6zmIz6I61y8z16j30+FS7/iPBez9TOBpcj6bg
         MeAq58R5U100Q1gaGcZOmTbA7GPZb8m4EisgrV6b/zJVUEi3mvtR4gAgpZ4DBVzBqn/T
         223A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to:content-transfer-encoding;
        bh=u2350BC6Tj+VGKH42GVsogueTiuUeAkWfuCJy5MqcTU=;
        b=OOWO3hUNx8KlEUivg2G1MYFk3+iRo3CgNqkn8BFIdSKD6ZieL218KxYVMv5l92VF8M
         1bXioamurthpnkO6Cztu0eKeZscU8iA7tGZKPoTo1kS5ftNGDkBmjAvrGld6vHW3lJs7
         nkRT3lfJIOkdNisbJVMznQ7K5mHJYD/Z3n6XpI0sUX8a8CbqSHFlW+y/l8MHVpN7q8jk
         ZJNQYqJer9p504zzQrc8RksVyrsi3uA4YoTAz2kWsLkEBzjNpvMSc4fmccVXUezEqL8G
         PcE0TZlApaGXqq0/zaP+Rue3RZSx99vIxVfiTIt6icJdyohbQBWbplTIVixVbaDc7xry
         ZQjA==
X-Gm-Message-State: APjAAAVR/e9fUF0o8wmm6AiNOOfZh0EQPg96+w5CeFiqQmWSvkwH4rTb
        YJwfjJ+q4LR4ouKUOho4uhVDJqXUTT21fkchKTc=
X-Google-Smtp-Source: APXvYqwk8HQYFWGp2f4bHuPrgsyu3uAn1uU/t8zMS84bLlHMYSLfVSNMEjyvY//sLePD/v+gNg5hy+XjLshIbsAFWIk=
X-Received: by 2002:a5e:a616:: with SMTP id q22mr35421ioi.250.1581091021067;
 Fri, 07 Feb 2020 07:57:01 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6622:1ac:0:0:0:0 with HTTP; Fri, 7 Feb 2020 07:57:00
 -0800 (PST)
Reply-To: angela2egom@gmail.com
In-Reply-To: <CAAWG6cJ2Z-tb__B-1i7-4U2W9xxaOTr0T5swNApOVzxenHmhuw@mail.gmail.com>
References: <CAAWG6cK1oik6eeYm1fWmvFAhM+2VYCHBJhQy7hphV8DTn8rUHw@mail.gmail.com>
 <CAAWG6cJ2Z-tb__B-1i7-4U2W9xxaOTr0T5swNApOVzxenHmhuw@mail.gmail.com>
From:   Jerry Michael <dhlcompanytgo@gmail.com>
Date:   Fri, 7 Feb 2020 15:57:00 +0000
Message-ID: <CAAWG6cLQSAUb0d2rSfV413Pk=UruNGR4mwwW33UZrreqxofPCQ@mail.gmail.com>
Subject: Fwd:
To:     dhlcompanytgo <dhlcompanytgo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Pg0KDQotLS0tLS0tLS0tIEZvcndhcmRlZCBtZXNzYWdlIC0tLS0tLS0tLS0NCkZyb206IEplcnJ5
IE1pY2hhZWwgPGRobGNvbXBhbnl0Z29AZ21haWwuY29tPg0KRGF0ZTogRnJpLCA3IEZlYiAyMDIw
IDE0OjQ0OjAyICswMDAwDQpTdWJqZWN0Og0KVG86IGRobGNvbXBhbnl0Z28gPGRobGNvbXBhbnl0
Z29AZ21haWwuY29tPg0KDQrQl9C00YDQsNCy0YHRgtCy0YPQuSwg0LTQvtGA0L7Qs9C+0LksDQoN
CtCa0LDQuiDRgtCy0L7QuCDQtNC10LvQsD8g0KLRiyDQv9C+0LvRg9GH0LjQuyDQvNC+0LUg0L/Q
vtGB0LvQtdC00L3QtdC1INC/0LjRgdGM0LzQvj8g0J/QvtC20LDQu9GD0LnRgdGC0LAsINGB0YDQ
vtGH0L3Qvg0K0L7RgtCy0LXRgtGMISDQodC/0LDRgdC40LHQviDQt9CwINC/0L7QvdC40LzQsNC9
0LjQtS4NCg0K0KEg0L3QsNC40LvRg9GH0YjQuNC80Lgg0L/QvtC20LXQu9Cw0L3QuNGP0LzQuA0K
DQrQnNC40YHRgtC10YAg0JTQttC10YDRgNC4INCc0LDQudC60LsNCg==
