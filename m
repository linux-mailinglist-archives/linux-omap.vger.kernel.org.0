Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0035CE954F
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2019 04:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbfJ3D3h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Oct 2019 23:29:37 -0400
Received: from mga01.intel.com ([192.55.52.88]:43161 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726752AbfJ3D3h (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 29 Oct 2019 23:29:37 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Oct 2019 20:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,245,1569308400"; 
   d="gz'50?scan'50,208,50";a="193830330"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Oct 2019 20:29:33 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iPeft-000GEA-Cv; Wed, 30 Oct 2019 11:29:33 +0800
Date:   Wed, 30 Oct 2019 11:29:14 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kbuild-all@lists.01.org, linux-omap@vger.kernel.org
Subject: [omap:droid4-pending-v5.4 16/26] include/linux/serdev-gsm.h:29:2:
 error: unknown type name 'atomic_t'
Message-ID: <201910301113.EBit6IOu%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3cqh2kbscwlkqjbk"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--3cqh2kbscwlkqjbk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git droid4-pending-v5.4
head:   3efaedc5ef6cde5bfde516b6db455b306b5ce5b7
commit: 2d0f14db2d1621061c1cbc73bf22009577902f4c [16/26] tty: n_gsm: Add support for serdev drivers
config: i386-randconfig-d002-201943 (attached as .config)
compiler: gcc-7 (Debian 7.4.0-14) 7.4.0
reproduce:
        git checkout 2d0f14db2d1621061c1cbc73bf22009577902f4c
        # save the attached .config to linux build tree
        make ARCH=i386 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <command-line>:0:0:
>> include/linux/serdev-gsm.h:29:2: error: unknown type name 'atomic_t'
     atomic_t asleep;
     ^~~~~~~~
>> include/linux/serdev-gsm.h:37:40: error: unknown type name 'u8'
     int (*output)(struct gsm_serdev *gsd, u8 *data, int len);
                                           ^~
   include/linux/serdev-gsm.h:39:14: error: unknown type name 'u8'
           const u8 *buf, int len);
                 ^~
>> include/linux/serdev-gsm.h:52:7: error: unknown type name 'size_t'
          size_t len);
          ^~~~~~
   include/linux/serdev-gsm.h:53:1: warning: no semicolon at end of struct or union
    };
    ^
   include/linux/serdev-gsm.h: In function 'gsm_serdev_register_device':
>> include/linux/serdev-gsm.h:172:10: error: 'ENODEV' undeclared (first use in this function)
     return -ENODEV;
             ^~~~~~
   include/linux/serdev-gsm.h:172:10: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/serdev-gsm.h: At top level:
   include/linux/serdev-gsm.h:180:51: warning: 'struct device' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void *gsm_serdev_get_drvdata(struct device *dev)
                                                      ^~~~~~
   include/linux/serdev-gsm.h: In function 'gsm_serdev_get_drvdata':
>> include/linux/serdev-gsm.h:182:9: error: 'NULL' undeclared (first use in this function)
     return NULL;
            ^~~~
   include/linux/serdev-gsm.h: At top level:
   include/linux/serdev-gsm.h:186:36: warning: 'struct device' declared inside parameter list will not be visible outside of this definition or declaration
    void gsm_serdev_set_drvdata(struct device *dev, void *drvdata)
                                       ^~~~~~
   include/linux/serdev-gsm.h: In function 'gsm_serdev_get_config':
   include/linux/serdev-gsm.h:193:10: error: 'ENODEV' undeclared (first use in this function)
     return -ENODEV;
             ^~~~~~
   include/linux/serdev-gsm.h: In function 'gsm_serdev_set_config':
   include/linux/serdev-gsm.h:199:10: error: 'ENODEV' undeclared (first use in this function)
     return -ENODEV;
             ^~~~~~
   include/linux/serdev-gsm.h: In function 'gsm_serdev_register_dlci':
   include/linux/serdev-gsm.h:206:10: error: 'ENODEV' undeclared (first use in this function)
     return -ENODEV;
             ^~~~~~
   include/linux/serdev-gsm.h: At top level:
   include/linux/serdev-gsm.h:217:14: error: unknown type name 'u8'
           const u8 *buf, int len)
                 ^~
   include/linux/serdev-gsm.h: In function 'gsm_serdev_write':
   include/linux/serdev-gsm.h:219:10: error: 'ENODEV' undeclared (first use in this function)
     return -ENODEV;
             ^~~~~~

vim +/atomic_t +29 include/linux/serdev-gsm.h

     8	
     9	/**
    10	 * struct gsm_serdev - serdev-gsm instance
    11	 * @serdev:		serdev instance
    12	 * @gsm:		ts 27.010 n_gsm instance
    13	 * @asleep:		device is in idle state
    14	 * @drvdata:		serdev-gsm consumer driver data
    15	 * @get_config:		get ts 27.010 config
    16	 * @set_config:		set ts 27.010 config
    17	 * @register_dlci:	register ts 27.010 channel
    18	 * @unregister_dlci:	unregister ts 27.010 channel
    19	 * @output:		read data from ts 27.010 channel
    20	 * @write:		write data to a ts 27.010 channel
    21	 * @kick:		indicate more data is ready
    22	 *
    23	 * Currently only serdev and output must be initialized, the rest are
    24	 * are initialized by gsm_serdev_register_dlci().
    25	 */
    26	struct gsm_serdev {
    27		struct serdev_device *serdev;
    28		struct gsm_mux *gsm;
  > 29		atomic_t asleep;
    30		void *drvdata;
    31		int (*get_config)(struct gsm_serdev *gsd, struct gsm_config *c);
    32		int (*set_config)(struct gsm_serdev *gsd, struct gsm_config *c);
    33		int (*register_dlci)(struct gsm_serdev *gsd,
    34				     struct gsm_serdev_dlci *ops);
    35		void (*unregister_dlci)(struct gsm_serdev *gsd,
    36					struct gsm_serdev_dlci *ops);
  > 37		int (*output)(struct gsm_serdev *gsd, u8 *data, int len);
    38		int (*write)(struct gsm_serdev *gsd, struct gsm_serdev_dlci *ops,
    39			     const u8 *buf, int len);
    40		void (*kick)(struct gsm_serdev *gsd);
    41	};
    42	
    43	/**
    44	 * struct gsm_serdev_dlci - serdev-gsm ts 27.010 channel data
    45	 * @line:		ts 27.010 channel, control channel 0 is not available
    46	 * @receive_buf:	function to handle data received for the channel
    47	 */
    48	struct gsm_serdev_dlci {
    49		int line;
    50		int (*receive_buf)(struct gsm_serdev_dlci *ops,
    51				   const unsigned char *buf,
  > 52				   size_t len);
    53	};
    54	
    55	#ifdef CONFIG_SERIAL_DEV_BUS
    56	
    57	int gsm_serdev_register_device(struct gsm_serdev *gsd);
    58	void gsm_serdev_unregister_device(struct gsm_serdev *gsd);
    59	
    60	static inline void *gsm_serdev_get_drvdata(struct device *dev)
    61	{
    62		struct serdev_device *serdev = to_serdev_device(dev);
    63		struct gsm_serdev *gsd = serdev_device_get_drvdata(serdev);
    64	
    65		if (gsd)
    66			return gsd->drvdata;
    67	
    68		return NULL;
    69	}
    70	
    71	static inline void gsm_serdev_set_drvdata(struct device *dev, void *drvdata)
    72	{
    73		struct serdev_device *serdev = to_serdev_device(dev);
    74		struct gsm_serdev *gsd = serdev_device_get_drvdata(serdev);
    75	
    76		if (gsd)
    77			gsd->drvdata = drvdata;
    78	}
    79	
    80	/**
    81	 * gsm_serdev_get_config - read ts 27.010 config
    82	 * @gsd:	serdev-gsm instance
    83	 * @c:		ts 27.010 config data
    84	 *
    85	 * See gsm_copy_config_values() for more information.
    86	 */
    87	static inline
    88	int gsm_serdev_get_config(struct gsm_serdev *gsd, struct gsm_config *c)
    89	{
    90		return gsd->get_config(gsd, c);
    91	}
    92	
    93	/**
    94	 * gsm_serdev_set_config - set ts 27.010 config
    95	 * @gsd:	serdev-gsm instance
    96	 * @c:		ts 27.010 config data
    97	 *
    98	 * See gsm_config() for more information.
    99	 */
   100	static inline
   101	int gsm_serdev_set_config(struct gsm_serdev *gsd, struct gsm_config *c)
   102	{
   103		if (gsd && gsd->set_config)
   104			return gsd->set_config(gsd, c);
   105	
   106		return -ENODEV;
   107	}
   108	
   109	/**
   110	 * gsm_serdev_register_dlci - register a ts 27.010 channel
   111	 * @gsd:	serdev-gsm instance
   112	 * @ops:	channel ops
   113	 */
   114	static inline
   115	int gsm_serdev_register_dlci(struct gsm_serdev *gsd,
   116				     struct gsm_serdev_dlci *ops)
   117	{
   118		if (gsd && gsd->register_dlci)
   119			return gsd->register_dlci(gsd, ops);
   120	
   121		return -ENODEV;
   122	}
   123	
   124	/**
   125	 * gsm_serdev_unregister_dlci - unregister a ts 27.010 channel
   126	 * @gsd:	serdev-gsm instance
   127	 * @ops:	channel ops
   128	 */
   129	static inline
   130	void gsm_serdev_unregister_dlci(struct gsm_serdev *gsd,
   131					struct gsm_serdev_dlci *ops)
   132	{
   133		if (gsd && gsd->unregister_dlci)
   134			gsd->unregister_dlci(gsd, ops);
   135	}
   136	
   137	/**
   138	 * gsm_serdev_write - write data to a ts 27.010 channel
   139	 * @gsd:	serdev-gsm instance
   140	 * @ops:	channel ops
   141	 * @buf:	write buffer
   142	 * @len:	buffer length
   143	 */
   144	static inline
   145	int gsm_serdev_write(struct gsm_serdev *gsd, struct gsm_serdev_dlci *ops,
   146			     const u8 *buf, int len)
   147	{
   148		if (gsd && gsd->write)
   149			return gsd->write(gsd, ops, buf, len);
   150	
   151		return -ENODEV;
   152	}
   153	
   154	/**
   155	 * gsm_serdev_data_kick - indicate more data can be trasmitted
   156	 * @gsd:	serdev-gsm instance
   157	 *
   158	 * See gsm_data_kick() for more information.
   159	 */
   160	static inline
   161	void gsm_serdev_data_kick(struct gsm_serdev *gsd)
   162	{
   163		if (gsd && gsd->kick)
   164			gsd->kick(gsd);
   165	}
   166	
   167	#else	/* CONFIG_SERIAL_DEV_BUS */
   168	
   169	static inline
   170	int gsm_serdev_register_device(struct gsm_serdev *gsd)
   171	{
 > 172		return -ENODEV;
   173	}
   174	
   175	static inline
   176	void gsm_serdev_unregister_device(struct gsm_serdev *gsd)
   177	{
   178	}
   179	
   180	static inline void *gsm_serdev_get_drvdata(struct device *dev)
   181	{
 > 182		return NULL;
   183	}
   184	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--3cqh2kbscwlkqjbk
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--3cqh2kbscwlkqjbk--
