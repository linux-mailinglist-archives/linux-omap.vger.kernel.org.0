Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECB520C07A
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jun 2020 11:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgF0Jf2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 27 Jun 2020 05:35:28 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:42723 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726160AbgF0Jf1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Sat, 27 Jun 2020 05:35:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id p7F4jpCPwrl4Bp7F7jSiQA; Sat, 27 Jun 2020 11:35:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593250526; bh=djCCE7OKoIpYQ9Z8j1hpBW1tx5BOQY6bwirNRRWaHBI=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=H8DDRnjSORJGHA8sr1WelvBosgGhP0ObLfNOdAhWtKabwauW8OOiIZ14bQfJLgCfb
         oeMou8uQZjzB48UkMgwK9J7T3YkI8ZOeflCtJh4Dx5dnUFgb/bJdAWxQ6rdKztnvkJ
         JtYSBxXA7Kj1nZVlpGz79wamauaRONQecU3e+YRHa/6X3w7YJ4MLcnETqf8+thytQk
         6inmha4yMyaEZ5XtAkf/MuHdcb9dAwvEpAwaXskbrrFcF7tUKWjIUuSUzuIHunfIgA
         4K/g54dSUp6LNMk8CgkD5ktDB/POjyT7LlMqAyYVxKgFxZSMWGBWXrKA1A+oMgHQFD
         E4H8wXS9q5v1w==
Subject: [PATCH 9/7] MAINTAINERS: remove SOC-CAMERA entry
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>
References: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
 <20200626115321.1898798-8-hverkuil-cisco@xs4all.nl>
 <8c9e0509-38c6-2013-740f-56b9e229d837@xs4all.nl>
Message-ID: <3e6f90c5-c111-9b1c-4741-4ebe3b8b1a67@xs4all.nl>
Date:   Sat, 27 Jun 2020 11:35:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <8c9e0509-38c6-2013-740f-56b9e229d837@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHZkMkQntfyXFW5GeWDxTPAv081M3J7DkZs4RiRCqi0SnBVxfVGx2Hb4ynqrB3+b0ILzUCg5WqlO7JHjN1IRwcFFFfpNFUw7VPNDjA0MnvqQ8IRS8tvE
 N5ydCfvpDBArpipYOIe/ynbiSWuBVP6JgooT9h/uzb1FzFmwV/os3TmWeF8t0VKWbencXGI6bG+tg6uC1wYouUkTKWy3ApPZVQO4/OhkNhRm8LJwe/E2QviF
 Xb3TYabn/7C6lSllkHqabZTHl/VxFVyBTk6tDfX/hX11AeremYZbqsxnngeUMuoK
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

After the removal of the soc_camera driver and the soc_camera.h header
the SOC-CAMERA entry in the MAINTAINERS file can also be removed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/MAINTAINERS b/MAINTAINERS
index 634d2c3d621a..ef9afc88e9d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15764,13 +15764,6 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/smsc/smsc9420.*

-SOC-CAMERA V4L2 SUBSYSTEM
-L:	linux-media@vger.kernel.org
-S:	Orphan
-T:	git git://linuxtv.org/media_tree.git
-F:	drivers/staging/media/soc_camera/
-F:	include/media/soc_camera.h
-
 SOCIONEXT (SNI) AVE NETWORK DRIVER
 M:	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
 L:	netdev@vger.kernel.org

